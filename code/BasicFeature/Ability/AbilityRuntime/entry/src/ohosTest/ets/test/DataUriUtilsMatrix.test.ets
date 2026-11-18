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

/** 执行一次 uri 运算：成功时返回结果的字符串形式，抛错时返回“错误码:错误信息”。 */
function errorOf(call: () => string | number): string {
  try {
    return String(call());
  } catch (error) {
    return `${(error as BusinessError).code}:${(error as BusinessError).message}`;
  }
}

export default function dataUriUtilsMatrixTest(): void {
  describe('AbilityRuntimeDataUriUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0001
     * @tc.name      testDataUriUtilsMatrix0001
     * @tc.desc      页面 getId/deleteId/updateId 按钮写死的 uri：getId("com.example.dataUriUtils/1221") 为 1221，deleteId 为
     *               "com.example.dataUriUtils"，updateId 为 "com.example.dataUriUtils/1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataUriUtilsMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0001 begin');
      const uri: string = 'com.example.dataUriUtils/1221';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1221);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example.dataUriUtils');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('com.example.dataUriUtils/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0002
     * @tc.name      testDataUriUtilsMatrix0002
     * @tc.desc      不含路径分隔符：对 "com.example.dataUriUtils" 调 getId、deleteId、updateId 都抛 401 Invalid input parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0002 begin');
      const uri: string = 'com.example.dataUriUtils';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1122));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0003
     * @tc.name      testDataUriUtilsMatrix0003
     * @tc.desc      dataability 形式的 uri：getId("dataability:///com.samples.abilityruntime/entry/table/7") 为 7，deleteId
     *               为 "dataability:///com.samples.abilityruntime/entry/table"，updateId 为
     *               "dataability:///com.samples.abilityruntime/entry/table/1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataUriUtilsMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0003 begin');
      const uri: string = 'dataability:///com.samples.abilityruntime/entry/table/7';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(7);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('dataability:///com.samples.abilityruntime/entry/table');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('dataability:///com.samples.abilityruntime/entry/table/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0004
     * @tc.name      testDataUriUtilsMatrix0004
     * @tc.desc      datashare 形式的 uri：getId("datashare:///com.samples.abilityruntime/entry/db/user/2") 为 2，deleteId 为
     *               "datashare:///com.samples.abilityruntime/entry/db/user"，updateId 为
     *               "datashare:///com.samples.abilityruntime/entry/db/user/1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0004 begin');
      const uri: string = 'datashare:///com.samples.abilityruntime/entry/db/user/2';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(2);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('datashare:///com.samples.abilityruntime/entry/db/user');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('datashare:///com.samples.abilityruntime/entry/db/user/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0005
     * @tc.name      testDataUriUtilsMatrix0005
     * @tc.desc      file 形式的 uri：getId("file://media/Photo/12") 为 12，deleteId 为 "file://media/Photo"，updateId 为
     *               "file://media/Photo/1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0005 begin');
      const uri: string = 'file://media/Photo/12';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(12);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('file://media/Photo');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('file://media/Photo/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0006
     * @tc.name      testDataUriUtilsMatrix0006
     * @tc.desc      末段是 int32 最大值：getId("https://docs.openharmony.cn/pages/2147483647") 为 2147483647，deleteId 为
     *               "https://docs.openharmony.cn/pages"，updateId 为 "https://docs.openharmony.cn/pages/1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0006 begin');
      const uri: string = 'https://docs.openharmony.cn/pages/2147483647';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(2147483647);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('https://docs.openharmony.cn/pages');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('https://docs.openharmony.cn/pages/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0007
     * @tc.name      testDataUriUtilsMatrix0007
     * @tc.desc      末段是 0：getId("com.example/0") 为 0，deleteId 为 "com.example"，updateId 为 "com.example/1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0007 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0008
     * @tc.name      testDataUriUtilsMatrix0008
     * @tc.desc      末段带前导 0：getId("com.example/007") 为 7，deleteId 为 "com.example"，updateId 为 "com.example/1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0008 begin');
      const uri: string = 'com.example/007';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(7);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('com.example/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0009
     * @tc.name      testDataUriUtilsMatrix0009
     * @tc.desc      路径里有两段数字，只取最后一段：getId("com.example/12/34") 为 34，deleteId 为 "com.example/12"，updateId 为
     *               "com.example/12/1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0009 begin');
      const uri: string = 'com.example/12/34';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(34);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example/12');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('com.example/12/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0010
     * @tc.name      testDataUriUtilsMatrix0010
     * @tc.desc      多级路径：getId("a/b/c/99999") 为 99999，deleteId 为 "a/b/c"，updateId 为 "a/b/c/1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0010 begin');
      const uri: string = 'a/b/c/99999';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(99999);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('a/b/c');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('a/b/c/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0011
     * @tc.name      testDataUriUtilsMatrix0011
     * @tc.desc      只有根分隔符和数字：getId("/123") 为 123，deleteId 为 空串，updateId 为 "/1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0011 begin');
      const uri: string = '/123';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(123);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0012
     * @tc.name      testDataUriUtilsMatrix0012
     * @tc.desc      连续两个分隔符：getId("com.example//5") 为 5，deleteId 为 "com.example/"，updateId 为 "com.example//1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0012 begin');
      const uri: string = 'com.example//5';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(5);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example/');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('com.example//1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0013
     * @tc.name      testDataUriUtilsMatrix0013
     * @tc.desc      路径里有中文：getId("中文/路径/42") 为 42，deleteId 为 "中文/路径"，updateId 为 "中文/路径/1122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0013 begin');
      const uri: string = '中文/路径/42';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(42);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('中文/路径');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('中文/路径/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0014
     * @tc.name      testDataUriUtilsMatrix0014
     * @tc.desc      末段不是数字：对 "com.example/abc" 调 getId、deleteId、updateId 都抛 401 Invalid input parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0014 begin');
      const uri: string = 'com.example/abc';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1122));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0015
     * @tc.name      testDataUriUtilsMatrix0015
     * @tc.desc      以分隔符结尾，末段为空：对 "com.example/" 调 getId、deleteId、updateId 都抛 401 Invalid input parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0015 begin');
      const uri: string = 'com.example/';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1122));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0016
     * @tc.name      testDataUriUtilsMatrix0016
     * @tc.desc      数字后面还有分隔符：对 "com.example/5/" 调 getId、deleteId、updateId 都抛 401 Invalid input parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0016 begin');
      const uri: string = 'com.example/5/';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1122));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0017
     * @tc.name      testDataUriUtilsMatrix0017
     * @tc.desc      数字后面跟字母：对 "com.example/12a" 调 getId、deleteId、updateId 都抛 401 Invalid input parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0017 begin');
      const uri: string = 'com.example/12a';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1122));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0018
     * @tc.name      testDataUriUtilsMatrix0018
     * @tc.desc      带查询参数：对 "com.example/1221?x=1" 调 getId、deleteId、updateId 都抛 401 Invalid input parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0018 begin');
      const uri: string = 'com.example/1221?x=1';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1122));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0019
     * @tc.name      testDataUriUtilsMatrix0019
     * @tc.desc      带片段：对 "com.example/1221#top" 调 getId、deleteId、updateId 都抛 401 Invalid input parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0019 begin');
      const uri: string = 'com.example/1221#top';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1122));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0020
     * @tc.name      testDataUriUtilsMatrix0020
     * @tc.desc      只有反斜杠，不算路径分隔符：对 "C:\dir\9" 调 getId、deleteId、updateId 都抛 401 Invalid input parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0020 begin');
      const uri: string = 'C:\\dir\\9';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1122));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0021
     * @tc.name      testDataUriUtilsMatrix0021
     * @tc.desc      空串：对 空串 调 getId、deleteId、updateId 都抛 401 Invalid input parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0021 begin');
      const uri: string = '';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1122));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0022
     * @tc.name      testDataUriUtilsMatrix0022
     * @tc.desc      页面 attachId 按钮写死的入参：attachId("com.example.dataUriUtils", 1122) 为 "com.example.dataUriUtils/1122"，
     *               getId 取回 1122，deleteId 还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataUriUtilsMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0022 begin');
      const uri: string = dataUriUtils.attachId('com.example.dataUriUtils', 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example.dataUriUtils/1122');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1122);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example.dataUriUtils');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0023
     * @tc.name      testDataUriUtilsMatrix0023
     * @tc.desc      id 为 0：attachId("com.example", 0) 为 "com.example/0"，getId 取回 0，deleteId 还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0023 begin');
      const uri: string = dataUriUtils.attachId('com.example', 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example/0');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0024
     * @tc.name      testDataUriUtilsMatrix0024
     * @tc.desc      id 为 1：attachId("com.example", 1) 为 "com.example/1"，getId 取回 1，deleteId 还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0024 begin');
      const uri: string = dataUriUtils.attachId('com.example', 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example/1');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0025
     * @tc.name      testDataUriUtilsMatrix0025
     * @tc.desc      id 为 int32 最大值：attachId("com.example", 2147483647) 为 "com.example/2147483647"，getId 取回 2147483647，
     *               deleteId 还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0025 begin');
      const uri: string = dataUriUtils.attachId('com.example', 2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example/2147483647');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2147483647);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0026
     * @tc.name      testDataUriUtilsMatrix0026
     * @tc.desc      id 为最大安全整数：attachId("com.example", 9007199254740991) 为 "com.example/9007199254740991"，getId 取回
     *               9007199254740991，deleteId 还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0026 begin');
      const uri: string = dataUriUtils.attachId('com.example', 9007199254740991);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example/9007199254740991');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(9007199254740991);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0027
     * @tc.name      testDataUriUtilsMatrix0027
     * @tc.desc      已带 id 的 uri 再附加一段：attachId("com.example/1221", 1122) 为 "com.example/1221/1122"，getId 取回 1122，
     *               deleteId 还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0027 begin');
      const uri: string = dataUriUtils.attachId('com.example/1221', 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example/1221/1122');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1122);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example/1221');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0028
     * @tc.name      testDataUriUtilsMatrix0028
     * @tc.desc      dataability 形式：attachId("dataability:///com.samples.abilityruntime/entry/table", 42) 为
     *               "dataability:///com.samples.abilityruntime/entry/table/42"，getId 取回 42，deleteId 还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0028 begin');
      const uri: string = dataUriUtils.attachId('dataability:///com.samples.abilityruntime/entry/table', 42);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('dataability:///com.samples.abilityruntime/entry/table/42');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(42);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('dataability:///com.samples.abilityruntime/entry/table');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0029
     * @tc.name      testDataUriUtilsMatrix0029
     * @tc.desc      以分隔符结尾的 uri：attachId("com.example/", 8) 为 "com.example//8"，getId 取回 8，deleteId 还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0029 begin');
      const uri: string = dataUriUtils.attachId('com.example/', 8);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example//8');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(8);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0030
     * @tc.name      testDataUriUtilsMatrix0030
     * @tc.desc      空串：attachId(空串, 7) 为 "/7"，getId 取回 7，deleteId 还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0030 begin');
      const uri: string = dataUriUtils.attachId('', 7);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('/7');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(7);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0031
     * @tc.name      testDataUriUtilsMatrix0031
     * @tc.desc      中文 uri：attachId("中文", 3) 为 "中文/3"，getId 取回 3，deleteId 还原
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0031 begin');
      const uri: string = dataUriUtils.attachId('中文', 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('中文/3');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(3);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0032
     * @tc.name      testDataUriUtilsMatrix0032
     * @tc.desc      页面 uri 用 updateId 换成 0，再 getId 取回 0，deleteId 仍为原前缀
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0032 begin');
      const uri: string = dataUriUtils.updateId('com.example.dataUriUtils/1221', 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example.dataUriUtils/0');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example.dataUriUtils');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0033
     * @tc.name      testDataUriUtilsMatrix0033
     * @tc.desc      页面 uri 用 updateId 换成 1，再 getId 取回 1，deleteId 仍为原前缀
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0033 begin');
      const uri: string = dataUriUtils.updateId('com.example.dataUriUtils/1221', 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example.dataUriUtils/1');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example.dataUriUtils');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0034
     * @tc.name      testDataUriUtilsMatrix0034
     * @tc.desc      页面 uri 用 updateId 换成 99，再 getId 取回 99，deleteId 仍为原前缀
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0034 begin');
      const uri: string = dataUriUtils.updateId('com.example.dataUriUtils/1221', 99);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example.dataUriUtils/99');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(99);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example.dataUriUtils');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0035
     * @tc.name      testDataUriUtilsMatrix0035
     * @tc.desc      页面 uri 用 updateId 换成 1221，再 getId 取回 1221，deleteId 仍为原前缀
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0035 begin');
      const uri: string = dataUriUtils.updateId('com.example.dataUriUtils/1221', 1221);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example.dataUriUtils/1221');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1221);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example.dataUriUtils');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0036
     * @tc.name      testDataUriUtilsMatrix0036
     * @tc.desc      页面 uri 用 updateId 换成 2147483647，再 getId 取回 2147483647，deleteId 仍为原前缀
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0036 begin');
      const uri: string = dataUriUtils.updateId('com.example.dataUriUtils/1221', 2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example.dataUriUtils/2147483647');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2147483647);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example.dataUriUtils');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0037
     * @tc.name      testDataUriUtilsMatrix0037
     * @tc.desc      页面 uri 用 updateId 换成 9007199254740991，再 getId 取回 9007199254740991，deleteId 仍为原前缀
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0037 begin');
      const uri: string = dataUriUtils.updateId('com.example.dataUriUtils/1221', 9007199254740991);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example.dataUriUtils/9007199254740991');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(9007199254740991);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example.dataUriUtils');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0038
     * @tc.name      testDataUriUtilsMatrix0038
     * @tc.desc      连续两次 updateId 只保留最后一次的 id，路径段数不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0038 begin');
      const once: string = dataUriUtils.updateId('com.example.dataUriUtils/1221', 1);
      const twice: string = dataUriUtils.updateId(once, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 once=${once}`);
      expect(once).assertEqual('com.example.dataUriUtils/1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 twice=${twice}`);
      expect(twice).assertEqual('com.example.dataUriUtils/2');
      const actual3: number = twice.split('/').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0039
     * @tc.name      testDataUriUtilsMatrix0039
     * @tc.desc      attachId → updateId → deleteId 依次执行，最后回到原始前缀
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0039 begin');
      const attached: string = dataUriUtils.attachId('com.example.dataUriUtils', 5);
      const updated: string = dataUriUtils.updateId(attached, 6);
      const deleted: string = dataUriUtils.deleteId(updated);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 attached=${attached}`);
      expect(attached).assertEqual('com.example.dataUriUtils/5');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 updated=${updated}`);
      expect(updated).assertEqual('com.example.dataUriUtils/6');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 deleted=${deleted}`);
      expect(deleted).assertEqual('com.example.dataUriUtils');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0040
     * @tc.name      testDataUriUtilsMatrix0040
     * @tc.desc      不带 id 的 uri 直接 updateId 抛 401，attachId 之后再 updateId 才生效
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0040 begin');
      const plain: string = 'com.example.dataUriUtils';
      const attached: string = dataUriUtils.attachId(plain, 1);
      const actual1: string = errorOf(() => dataUriUtils.updateId(plain, 9));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 attached=${attached}`);
      expect(attached).assertEqual('com.example.dataUriUtils/1');
      const actual3: string = dataUriUtils.updateId(attached, 9);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example.dataUriUtils/9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0041
     * @tc.name      testDataUriUtilsMatrix0041
     * @tc.desc      对同一个 uri 连续 deleteId：数字段逐段删除，末段不再是数字时再删抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0041 begin');
      const first: string = dataUriUtils.deleteId('com.example/1/2/3');
      const second: string = dataUriUtils.deleteId(first);
      const third: string = dataUriUtils.deleteId(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 first=${first}`);
      expect(first).assertEqual('com.example/1/2');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 second=${second}`);
      expect(second).assertEqual('com.example/1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 third=${third}`);
      expect(third).assertEqual('com.example');
      const actual4: string = errorOf(() => dataUriUtils.deleteId(third));
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0042
     * @tc.name      testDataUriUtilsMatrix0042
     * @tc.desc      多次 attachId 叠加多段 id，getId 总是取最后附加的那个
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0042 begin');
      let uri: string = 'com.example';
      uri = dataUriUtils.attachId(uri, 10);
      uri = dataUriUtils.attachId(uri, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example/10/20');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(20);
      const actual3: number = dataUriUtils.getId(dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_0043
     * @tc.name      testDataUriUtilsMatrix0043
     * @tc.desc      接口是纯字符串运算：同一入参多次调用结果一致，入参本身不被修改
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0043 begin');
      const uri: string = 'com.example.dataUriUtils/1221';
      const first: string = dataUriUtils.updateId(uri, 3);
      const second: string = dataUriUtils.updateId(uri, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 first=${first}`);
      expect(first).assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 uri=${uri}`);
      expect(uri).assertEqual('com.example.dataUriUtils/1221');
      const actual3: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1221);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsMatrix0043 end');
    })
  })
}
