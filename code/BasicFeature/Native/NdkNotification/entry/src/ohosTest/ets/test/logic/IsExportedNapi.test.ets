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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { isExportedNapi } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isExportedNapi (30 cases). */
export default function isExportedNapiTest(): void {
  describe('IsExportedNapiTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0001
     * @tc.name      NdkNotification_IsExportedNapi_0001
     * @tc.desc      isExportedNapi(name="Hello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_IsExportedNapi_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0001 begin`);
      const actual: boolean = isExportedNapi('Hello');
      logInfo(`isExportedNapi(name="Hello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0002
     * @tc.name      NdkNotification_IsExportedNapi_0002
     * @tc.desc      isExportedNapi(name="hello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_IsExportedNapi_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0002 begin`);
      const actual: boolean = isExportedNapi('hello world');
      logInfo(`isExportedNapi(name="hello world"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0003
     * @tc.name      NdkNotification_IsExportedNapi_0003
     * @tc.desc      isExportedNapi(name="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_IsExportedNapi_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0003 begin`);
      const actual: boolean = isExportedNapi('');
      logInfo(`isExportedNapi(name=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0004
     * @tc.name      NdkNotification_IsExportedNapi_0004
     * @tc.desc      isExportedNapi(name=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0004 begin`);
      const actual: boolean = isExportedNapi(' ');
      logInfo(`isExportedNapi(name=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0005
     * @tc.name      NdkNotification_IsExportedNapi_0005
     * @tc.desc      isExportedNapi(name="A") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0005 begin`);
      const actual: boolean = isExportedNapi('A');
      logInfo(`isExportedNapi(name="A"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0006
     * @tc.name      NdkNotification_IsExportedNapi_0006
     * @tc.desc      isExportedNapi(name="Sample Title 123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0006 begin`);
      const actual: boolean = isExportedNapi('Sample Title 123');
      logInfo(`isExportedNapi(name="Sample Title 123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0007
     * @tc.name      NdkNotification_IsExportedNapi_0007
     * @tc.desc      isExportedNapi(name="??") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0007 begin`);
      const actual: boolean = isExportedNapi('\u4e2d\u6587');
      logInfo(`isExportedNapi(name="??"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0008
     * @tc.name      NdkNotification_IsExportedNapi_0008
     * @tc.desc      isExportedNapi(name="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0008 begin`);
      const actual: boolean = isExportedNapi('a');
      logInfo(`isExportedNapi(name="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0009
     * @tc.name      NdkNotification_IsExportedNapi_0009
     * @tc.desc      isExportedNapi(name="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0009 begin`);
      const actual: boolean = isExportedNapi('abc');
      logInfo(`isExportedNapi(name="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0010
     * @tc.name      NdkNotification_IsExportedNapi_0010
     * @tc.desc      isExportedNapi(name="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0010 begin`);
      const actual: boolean = isExportedNapi('Hello World');
      logInfo(`isExportedNapi(name="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0011
     * @tc.name      NdkNotification_IsExportedNapi_0011
     * @tc.desc      isExportedNapi(name="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0011 begin`);
      const actual: boolean = isExportedNapi('123');
      logInfo(`isExportedNapi(name="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0012
     * @tc.name      NdkNotification_IsExportedNapi_0012
     * @tc.desc      isExportedNapi(name=" Hello ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_IsExportedNapi_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0012 begin`);
      const actual: boolean = isExportedNapi(' Hello ');
      logInfo(`isExportedNapi(name=" Hello "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0013
     * @tc.name      NdkNotification_IsExportedNapi_0013
     * @tc.desc      isExportedNapi(name="HelloHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0013 begin`);
      const actual: boolean = isExportedNapi('HelloHello');
      logInfo(`isExportedNapi(name="HelloHello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0014
     * @tc.name      NdkNotification_IsExportedNapi_0014
     * @tc.desc      isExportedNapi(name="Hello_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0014 begin`);
      const actual: boolean = isExportedNapi('Hello_1');
      logInfo(`isExportedNapi(name="Hello_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0015
     * @tc.name      NdkNotification_IsExportedNapi_0015
     * @tc.desc      isExportedNapi(name="xHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_IsExportedNapi_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0015 begin`);
      const actual: boolean = isExportedNapi('xHello');
      logInfo(`isExportedNapi(name="xHello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0016
     * @tc.name      NdkNotification_IsExportedNapi_0016
     * @tc.desc      isExportedNapi(name=" hello world ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_IsExportedNapi_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0016 begin`);
      const actual: boolean = isExportedNapi(' hello world ');
      logInfo(`isExportedNapi(name=" hello world "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0017
     * @tc.name      NdkNotification_IsExportedNapi_0017
     * @tc.desc      isExportedNapi(name="hello worldhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0017 begin`);
      const actual: boolean = isExportedNapi('hello worldhello world');
      logInfo(`isExportedNapi(name="hello worldhello wor...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0018
     * @tc.name      NdkNotification_IsExportedNapi_0018
     * @tc.desc      isExportedNapi(name="hello world_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0018 begin`);
      const actual: boolean = isExportedNapi('hello world_1');
      logInfo(`isExportedNapi(name="hello world_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0019
     * @tc.name      NdkNotification_IsExportedNapi_0019
     * @tc.desc      isExportedNapi(name="xhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_IsExportedNapi_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0019 begin`);
      const actual: boolean = isExportedNapi('xhello world');
      logInfo(`isExportedNapi(name="xhello world"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0020
     * @tc.name      NdkNotification_IsExportedNapi_0020
     * @tc.desc      isExportedNapi(name="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_IsExportedNapi_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0020 begin`);
      const actual: boolean = isExportedNapi('   ');
      logInfo(`isExportedNapi(name="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0021
     * @tc.name      NdkNotification_IsExportedNapi_0021
     * @tc.desc      isExportedNapi(name="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0021 begin`);
      const actual: boolean = isExportedNapi('  ');
      logInfo(`isExportedNapi(name="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0022
     * @tc.name      NdkNotification_IsExportedNapi_0022
     * @tc.desc      isExportedNapi(name=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0022 begin`);
      const actual: boolean = isExportedNapi(' _1');
      logInfo(`isExportedNapi(name=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0023
     * @tc.name      NdkNotification_IsExportedNapi_0023
     * @tc.desc      isExportedNapi(name="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_IsExportedNapi_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0023 begin`);
      const actual: boolean = isExportedNapi('x ');
      logInfo(`isExportedNapi(name="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0024
     * @tc.name      NdkNotification_IsExportedNapi_0024
     * @tc.desc      isExportedNapi(name=" A ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_IsExportedNapi_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0024 begin`);
      const actual: boolean = isExportedNapi(' A ');
      logInfo(`isExportedNapi(name=" A "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0025
     * @tc.name      NdkNotification_IsExportedNapi_0025
     * @tc.desc      isExportedNapi(name="AA") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0025 begin`);
      const actual: boolean = isExportedNapi('AA');
      logInfo(`isExportedNapi(name="AA"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0026
     * @tc.name      NdkNotification_IsExportedNapi_0026
     * @tc.desc      isExportedNapi(name="A_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0026 begin`);
      const actual: boolean = isExportedNapi('A_1');
      logInfo(`isExportedNapi(name="A_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0027
     * @tc.name      NdkNotification_IsExportedNapi_0027
     * @tc.desc      isExportedNapi(name="xA") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_IsExportedNapi_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0027 begin`);
      const actual: boolean = isExportedNapi('xA');
      logInfo(`isExportedNapi(name="xA"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0028
     * @tc.name      NdkNotification_IsExportedNapi_0028
     * @tc.desc      isExportedNapi(name=" Sample Title 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_IsExportedNapi_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0028 begin`);
      const actual: boolean = isExportedNapi(' Sample Title 123 ');
      logInfo(`isExportedNapi(name=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0029
     * @tc.name      NdkNotification_IsExportedNapi_0029
     * @tc.desc      isExportedNapi(name="Sample Title 123Sample Title 123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0029 begin`);
      const actual: boolean = isExportedNapi('Sample Title 123Sample Title 123');
      logInfo(`isExportedNapi(name="Sample Title 123Samp...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_EXPORTED_NAPI_0030
     * @tc.name      NdkNotification_IsExportedNapi_0030
     * @tc.desc      isExportedNapi(name="Sample Title 123_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsExportedNapi_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsExportedNapi_0030 begin`);
      const actual: boolean = isExportedNapi('Sample Title 123_1');
      logInfo(`isExportedNapi(name="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsExportedNapi_0030 end`);
    });
  });
}
