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
import { getStringArrayData } from '../../../main/ets/data/ResourceDataHandle';

const DOMAIN: number = 0xF814;
const TAG: string = 'StringDataTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function resourceStringDataCoreTest(): void {
  describe('ResourceStringDataCoreTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_STRINGDATA_0501
     * @tc.name      testStringData0501
     * @tc.desc      Verify converting an empty resource array returns an empty list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStringData0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStringData0501 begin');
      const emptyInput: Resource[] = [];
      const actual: string[] = getStringArrayData(emptyInput);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.length=${actual.length}, expected=0`);
      expect(actual.length).assertEqual(0);
      log('testStringData0501 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_STRINGDATA_0502
     * @tc.name      testStringData0502
     * @tc.desc      Verify the conversion result of an empty array is a real array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStringData0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStringData0502 begin');
      const emptyInput: Resource[] = [];
      const actual: string[] = getStringArrayData(emptyInput);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(actual)=${Array.isArray(actual)}`);
      expect(Array.isArray(actual)).assertTrue();
      log('testStringData0502 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_STRINGDATA_0503
     * @tc.name      testStringData0503
     * @tc.desc      Verify repeated conversion of an empty array stays stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStringData0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStringData0503 begin');
      const emptyInput: Resource[] = [];
      const first: string[] = getStringArrayData(emptyInput);
      const second: string[] = getStringArrayData(emptyInput);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=second.length`);
      expect(first.length).assertEqual(second.length);
      log('testStringData0503 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_STRINGDATA_0504
     * @tc.name      testStringData0504
     * @tc.desc      Verify the converted empty result contains no string elements.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStringData0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStringData0504 begin');
      const emptyInput: Resource[] = [];
      const actual: string[] = getStringArrayData(emptyInput);
      let hasElement: boolean = false;
      actual.forEach((value: string) => {
        if (value !== undefined) {
          hasElement = true;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse hasElement=${hasElement}`);
      expect(hasElement).assertFalse();
      log('testStringData0504 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_STRINGDATA_0505
     * @tc.name      testStringData0505
     * @tc.desc      Verify conversion of an empty array returns object type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStringData0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStringData0505 begin');
      const emptyInput: Resource[] = [];
      const actual: string[] = getStringArrayData(emptyInput);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='object'`);
      expect(typeof actual).assertEqual('object');
      log('testStringData0505 end');
    })
  })
}
