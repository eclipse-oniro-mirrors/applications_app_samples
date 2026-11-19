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
import { startResultLogOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for startResultLogOf (96 cases). */
export default function startResultLogOf2Test(): void {
  describe('StartResultLogOf2Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0097
     * @tc.name      UIExtensionSamples_StartResultLogOf_0097
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="Hello") returns "resultCode:500bundleName:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0097 begin`);
      const actual: string = startResultLogOf(500, 'Hello');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:Hello');
      logInfo(`${BUNDLE}StartResultLogOf_0097 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0098
     * @tc.name      UIExtensionSamples_StartResultLogOf_0098
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="hello world") returns "resultCode:500bundleName:hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0098 begin`);
      const actual: string = startResultLogOf(500, 'hello world');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:hello world');
      logInfo(`${BUNDLE}StartResultLogOf_0098 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0099
     * @tc.name      UIExtensionSamples_StartResultLogOf_0099
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="") returns "resultCode:500bundleName:"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0099 begin`);
      const actual: string = startResultLogOf(500, '');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:');
      logInfo(`${BUNDLE}StartResultLogOf_0099 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0100
     * @tc.name      UIExtensionSamples_StartResultLogOf_0100
     * @tc.desc      startResultLogOf(resultCode=500, bundleName=" ") returns "resultCode:500bundleName: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0100 begin`);
      const actual: string = startResultLogOf(500, ' ');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName: ');
      logInfo(`${BUNDLE}StartResultLogOf_0100 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0101
     * @tc.name      UIExtensionSamples_StartResultLogOf_0101
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="A") returns "resultCode:500bundleName:A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0101 begin`);
      const actual: string = startResultLogOf(500, 'A');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:A');
      logInfo(`${BUNDLE}StartResultLogOf_0101 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0102
     * @tc.name      UIExtensionSamples_StartResultLogOf_0102
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="Sample Title 123") returns "resultCode:500bundleNam...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0102 begin`);
      const actual: string = startResultLogOf(500, 'Sample Title 123');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:Sample Title 123');
      logInfo(`${BUNDLE}StartResultLogOf_0102 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0103
     * @tc.name      UIExtensionSamples_StartResultLogOf_0103
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="??") returns "resultCode:500bundleName:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0103 begin`);
      const actual: string = startResultLogOf(500, '\u4e2d\u6587');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartResultLogOf_0103 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0104
     * @tc.name      UIExtensionSamples_StartResultLogOf_0104
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="a") returns "resultCode:500bundleName:a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0104 begin`);
      const actual: string = startResultLogOf(500, 'a');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:a');
      logInfo(`${BUNDLE}StartResultLogOf_0104 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0105
     * @tc.name      UIExtensionSamples_StartResultLogOf_0105
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="abc") returns "resultCode:500bundleName:abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0105 begin`);
      const actual: string = startResultLogOf(500, 'abc');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:abc');
      logInfo(`${BUNDLE}StartResultLogOf_0105 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0106
     * @tc.name      UIExtensionSamples_StartResultLogOf_0106
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="Hello World") returns "resultCode:500bundleName:Hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0106 begin`);
      const actual: string = startResultLogOf(500, 'Hello World');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:Hello World');
      logInfo(`${BUNDLE}StartResultLogOf_0106 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0107
     * @tc.name      UIExtensionSamples_StartResultLogOf_0107
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="123") returns "resultCode:500bundleName:123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0107 begin`);
      const actual: string = startResultLogOf(500, '123');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:123');
      logInfo(`${BUNDLE}StartResultLogOf_0107 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0108
     * @tc.name      UIExtensionSamples_StartResultLogOf_0108
     * @tc.desc      startResultLogOf(resultCode=500, bundleName=" Hello ") returns "resultCode:500bundleName: Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0108 begin`);
      const actual: string = startResultLogOf(500, ' Hello ');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName: Hello ');
      logInfo(`${BUNDLE}StartResultLogOf_0108 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0109
     * @tc.name      UIExtensionSamples_StartResultLogOf_0109
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="HelloHello") returns "resultCode:500bundleName:Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0109 begin`);
      const actual: string = startResultLogOf(500, 'HelloHello');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:HelloHello');
      logInfo(`${BUNDLE}StartResultLogOf_0109 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0110
     * @tc.name      UIExtensionSamples_StartResultLogOf_0110
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="Hello_1") returns "resultCode:500bundleName:Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0110 begin`);
      const actual: string = startResultLogOf(500, 'Hello_1');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:Hello_1');
      logInfo(`${BUNDLE}StartResultLogOf_0110 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0111
     * @tc.name      UIExtensionSamples_StartResultLogOf_0111
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="xHello") returns "resultCode:500bundleName:xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0111 begin`);
      const actual: string = startResultLogOf(500, 'xHello');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:xHello');
      logInfo(`${BUNDLE}StartResultLogOf_0111 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0112
     * @tc.name      UIExtensionSamples_StartResultLogOf_0112
     * @tc.desc      startResultLogOf(resultCode=500, bundleName=" hello world ") returns "resultCode:500bundleName: ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0112 begin`);
      const actual: string = startResultLogOf(500, ' hello world ');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName: hello world ');
      logInfo(`${BUNDLE}StartResultLogOf_0112 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0113
     * @tc.name      UIExtensionSamples_StartResultLogOf_0113
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="hello worldhello world") returns "resultCode:500bun...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0113 begin`);
      const actual: string = startResultLogOf(500, 'hello worldhello world');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:hello worldhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0113 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0114
     * @tc.name      UIExtensionSamples_StartResultLogOf_0114
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="hello world_1") returns "resultCode:500bundleName:h...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0114 begin`);
      const actual: string = startResultLogOf(500, 'hello world_1');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:hello world_1');
      logInfo(`${BUNDLE}StartResultLogOf_0114 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0115
     * @tc.name      UIExtensionSamples_StartResultLogOf_0115
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="xhello world") returns "resultCode:500bundleName:xh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0115 begin`);
      const actual: string = startResultLogOf(500, 'xhello world');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:xhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0115 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0116
     * @tc.name      UIExtensionSamples_StartResultLogOf_0116
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="   ") returns "resultCode:500bundleName:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0116 begin`);
      const actual: string = startResultLogOf(500, '   ');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:   ');
      logInfo(`${BUNDLE}StartResultLogOf_0116 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0117
     * @tc.name      UIExtensionSamples_StartResultLogOf_0117
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="  ") returns "resultCode:500bundleName:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0117 begin`);
      const actual: string = startResultLogOf(500, '  ');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:  ');
      logInfo(`${BUNDLE}StartResultLogOf_0117 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0118
     * @tc.name      UIExtensionSamples_StartResultLogOf_0118
     * @tc.desc      startResultLogOf(resultCode=500, bundleName=" _1") returns "resultCode:500bundleName: _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0118 begin`);
      const actual: string = startResultLogOf(500, ' _1');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName: _1');
      logInfo(`${BUNDLE}StartResultLogOf_0118 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0119
     * @tc.name      UIExtensionSamples_StartResultLogOf_0119
     * @tc.desc      startResultLogOf(resultCode=500, bundleName="x ") returns "resultCode:500bundleName:x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0119 begin`);
      const actual: string = startResultLogOf(500, 'x ');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName:x ');
      logInfo(`${BUNDLE}StartResultLogOf_0119 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0120
     * @tc.name      UIExtensionSamples_StartResultLogOf_0120
     * @tc.desc      startResultLogOf(resultCode=500, bundleName=" A ") returns "resultCode:500bundleName: A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0120 begin`);
      const actual: string = startResultLogOf(500, ' A ');
      logInfo(`startResultLogOf(resultCode=500, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:500bundleName: A ');
      logInfo(`${BUNDLE}StartResultLogOf_0120 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0121
     * @tc.name      UIExtensionSamples_StartResultLogOf_0121
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="Hello") returns "resultCode:-1bundleName:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0121 begin`);
      const actual: string = startResultLogOf(-1, 'Hello');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:Hello');
      logInfo(`${BUNDLE}StartResultLogOf_0121 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0122
     * @tc.name      UIExtensionSamples_StartResultLogOf_0122
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="hello world") returns "resultCode:-1bundleName:hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0122 begin`);
      const actual: string = startResultLogOf(-1, 'hello world');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:hello world');
      logInfo(`${BUNDLE}StartResultLogOf_0122 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0123
     * @tc.name      UIExtensionSamples_StartResultLogOf_0123
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="") returns "resultCode:-1bundleName:"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0123 begin`);
      const actual: string = startResultLogOf(-1, '');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:');
      logInfo(`${BUNDLE}StartResultLogOf_0123 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0124
     * @tc.name      UIExtensionSamples_StartResultLogOf_0124
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName=" ") returns "resultCode:-1bundleName: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0124 begin`);
      const actual: string = startResultLogOf(-1, ' ');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName: ');
      logInfo(`${BUNDLE}StartResultLogOf_0124 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0125
     * @tc.name      UIExtensionSamples_StartResultLogOf_0125
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="A") returns "resultCode:-1bundleName:A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0125 begin`);
      const actual: string = startResultLogOf(-1, 'A');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:A');
      logInfo(`${BUNDLE}StartResultLogOf_0125 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0126
     * @tc.name      UIExtensionSamples_StartResultLogOf_0126
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="Sample Title 123") returns "resultCode:-1bundleName:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0126 begin`);
      const actual: string = startResultLogOf(-1, 'Sample Title 123');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:Sample Title 123');
      logInfo(`${BUNDLE}StartResultLogOf_0126 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0127
     * @tc.name      UIExtensionSamples_StartResultLogOf_0127
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="??") returns "resultCode:-1bundleName:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0127 begin`);
      const actual: string = startResultLogOf(-1, '\u4e2d\u6587');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartResultLogOf_0127 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0128
     * @tc.name      UIExtensionSamples_StartResultLogOf_0128
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="a") returns "resultCode:-1bundleName:a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0128 begin`);
      const actual: string = startResultLogOf(-1, 'a');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:a');
      logInfo(`${BUNDLE}StartResultLogOf_0128 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0129
     * @tc.name      UIExtensionSamples_StartResultLogOf_0129
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="abc") returns "resultCode:-1bundleName:abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0129 begin`);
      const actual: string = startResultLogOf(-1, 'abc');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:abc');
      logInfo(`${BUNDLE}StartResultLogOf_0129 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0130
     * @tc.name      UIExtensionSamples_StartResultLogOf_0130
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="Hello World") returns "resultCode:-1bundleName:Hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0130 begin`);
      const actual: string = startResultLogOf(-1, 'Hello World');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:Hello World');
      logInfo(`${BUNDLE}StartResultLogOf_0130 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0131
     * @tc.name      UIExtensionSamples_StartResultLogOf_0131
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="123") returns "resultCode:-1bundleName:123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0131 begin`);
      const actual: string = startResultLogOf(-1, '123');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:123');
      logInfo(`${BUNDLE}StartResultLogOf_0131 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0132
     * @tc.name      UIExtensionSamples_StartResultLogOf_0132
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName=" Hello ") returns "resultCode:-1bundleName: Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0132 begin`);
      const actual: string = startResultLogOf(-1, ' Hello ');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName: Hello ');
      logInfo(`${BUNDLE}StartResultLogOf_0132 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0133
     * @tc.name      UIExtensionSamples_StartResultLogOf_0133
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="HelloHello") returns "resultCode:-1bundleName:HelloH...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0133 begin`);
      const actual: string = startResultLogOf(-1, 'HelloHello');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:HelloHello');
      logInfo(`${BUNDLE}StartResultLogOf_0133 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0134
     * @tc.name      UIExtensionSamples_StartResultLogOf_0134
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="Hello_1") returns "resultCode:-1bundleName:Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0134 begin`);
      const actual: string = startResultLogOf(-1, 'Hello_1');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:Hello_1');
      logInfo(`${BUNDLE}StartResultLogOf_0134 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0135
     * @tc.name      UIExtensionSamples_StartResultLogOf_0135
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="xHello") returns "resultCode:-1bundleName:xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0135 begin`);
      const actual: string = startResultLogOf(-1, 'xHello');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:xHello');
      logInfo(`${BUNDLE}StartResultLogOf_0135 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0136
     * @tc.name      UIExtensionSamples_StartResultLogOf_0136
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName=" hello world ") returns "resultCode:-1bundleName: he...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0136 begin`);
      const actual: string = startResultLogOf(-1, ' hello world ');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName: hello world ');
      logInfo(`${BUNDLE}StartResultLogOf_0136 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0137
     * @tc.name      UIExtensionSamples_StartResultLogOf_0137
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="hello worldhello world") returns "resultCode:-1bundl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0137 begin`);
      const actual: string = startResultLogOf(-1, 'hello worldhello world');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:hello worldhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0137 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0138
     * @tc.name      UIExtensionSamples_StartResultLogOf_0138
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="hello world_1") returns "resultCode:-1bundleName:hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0138 begin`);
      const actual: string = startResultLogOf(-1, 'hello world_1');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:hello world_1');
      logInfo(`${BUNDLE}StartResultLogOf_0138 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0139
     * @tc.name      UIExtensionSamples_StartResultLogOf_0139
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="xhello world") returns "resultCode:-1bundleName:xhel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0139 begin`);
      const actual: string = startResultLogOf(-1, 'xhello world');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:xhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0139 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0140
     * @tc.name      UIExtensionSamples_StartResultLogOf_0140
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="   ") returns "resultCode:-1bundleName:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0140 begin`);
      const actual: string = startResultLogOf(-1, '   ');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:   ');
      logInfo(`${BUNDLE}StartResultLogOf_0140 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0141
     * @tc.name      UIExtensionSamples_StartResultLogOf_0141
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="  ") returns "resultCode:-1bundleName:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0141 begin`);
      const actual: string = startResultLogOf(-1, '  ');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:  ');
      logInfo(`${BUNDLE}StartResultLogOf_0141 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0142
     * @tc.name      UIExtensionSamples_StartResultLogOf_0142
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName=" _1") returns "resultCode:-1bundleName: _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0142 begin`);
      const actual: string = startResultLogOf(-1, ' _1');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName: _1');
      logInfo(`${BUNDLE}StartResultLogOf_0142 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0143
     * @tc.name      UIExtensionSamples_StartResultLogOf_0143
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName="x ") returns "resultCode:-1bundleName:x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0143 begin`);
      const actual: string = startResultLogOf(-1, 'x ');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName:x ');
      logInfo(`${BUNDLE}StartResultLogOf_0143 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0144
     * @tc.name      UIExtensionSamples_StartResultLogOf_0144
     * @tc.desc      startResultLogOf(resultCode=-1, bundleName=" A ") returns "resultCode:-1bundleName: A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0144 begin`);
      const actual: string = startResultLogOf(-1, ' A ');
      logInfo(`startResultLogOf(resultCode=-1, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:-1bundleName: A ');
      logInfo(`${BUNDLE}StartResultLogOf_0144 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0145
     * @tc.name      UIExtensionSamples_StartResultLogOf_0145
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="Hello") returns "resultCode:1bundleName:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0145 begin`);
      const actual: string = startResultLogOf(1, 'Hello');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:Hello');
      logInfo(`${BUNDLE}StartResultLogOf_0145 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0146
     * @tc.name      UIExtensionSamples_StartResultLogOf_0146
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="hello world") returns "resultCode:1bundleName:hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0146 begin`);
      const actual: string = startResultLogOf(1, 'hello world');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:hello world');
      logInfo(`${BUNDLE}StartResultLogOf_0146 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0147
     * @tc.name      UIExtensionSamples_StartResultLogOf_0147
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="") returns "resultCode:1bundleName:"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0147 begin`);
      const actual: string = startResultLogOf(1, '');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:');
      logInfo(`${BUNDLE}StartResultLogOf_0147 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0148
     * @tc.name      UIExtensionSamples_StartResultLogOf_0148
     * @tc.desc      startResultLogOf(resultCode=1, bundleName=" ") returns "resultCode:1bundleName: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0148 begin`);
      const actual: string = startResultLogOf(1, ' ');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName: ');
      logInfo(`${BUNDLE}StartResultLogOf_0148 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0149
     * @tc.name      UIExtensionSamples_StartResultLogOf_0149
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="A") returns "resultCode:1bundleName:A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0149 begin`);
      const actual: string = startResultLogOf(1, 'A');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:A');
      logInfo(`${BUNDLE}StartResultLogOf_0149 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0150
     * @tc.name      UIExtensionSamples_StartResultLogOf_0150
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="Sample Title 123") returns "resultCode:1bundleName:Sa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0150 begin`);
      const actual: string = startResultLogOf(1, 'Sample Title 123');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:Sample Title 123');
      logInfo(`${BUNDLE}StartResultLogOf_0150 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0151
     * @tc.name      UIExtensionSamples_StartResultLogOf_0151
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="??") returns "resultCode:1bundleName:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0151 begin`);
      const actual: string = startResultLogOf(1, '\u4e2d\u6587');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartResultLogOf_0151 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0152
     * @tc.name      UIExtensionSamples_StartResultLogOf_0152
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="a") returns "resultCode:1bundleName:a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0152 begin`);
      const actual: string = startResultLogOf(1, 'a');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:a');
      logInfo(`${BUNDLE}StartResultLogOf_0152 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0153
     * @tc.name      UIExtensionSamples_StartResultLogOf_0153
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="abc") returns "resultCode:1bundleName:abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0153 begin`);
      const actual: string = startResultLogOf(1, 'abc');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:abc');
      logInfo(`${BUNDLE}StartResultLogOf_0153 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0154
     * @tc.name      UIExtensionSamples_StartResultLogOf_0154
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="Hello World") returns "resultCode:1bundleName:Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0154 begin`);
      const actual: string = startResultLogOf(1, 'Hello World');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:Hello World');
      logInfo(`${BUNDLE}StartResultLogOf_0154 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0155
     * @tc.name      UIExtensionSamples_StartResultLogOf_0155
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="123") returns "resultCode:1bundleName:123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0155 begin`);
      const actual: string = startResultLogOf(1, '123');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:123');
      logInfo(`${BUNDLE}StartResultLogOf_0155 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0156
     * @tc.name      UIExtensionSamples_StartResultLogOf_0156
     * @tc.desc      startResultLogOf(resultCode=1, bundleName=" Hello ") returns "resultCode:1bundleName: Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0156 begin`);
      const actual: string = startResultLogOf(1, ' Hello ');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName: Hello ');
      logInfo(`${BUNDLE}StartResultLogOf_0156 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0157
     * @tc.name      UIExtensionSamples_StartResultLogOf_0157
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="HelloHello") returns "resultCode:1bundleName:HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0157 begin`);
      const actual: string = startResultLogOf(1, 'HelloHello');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:HelloHello');
      logInfo(`${BUNDLE}StartResultLogOf_0157 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0158
     * @tc.name      UIExtensionSamples_StartResultLogOf_0158
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="Hello_1") returns "resultCode:1bundleName:Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0158 begin`);
      const actual: string = startResultLogOf(1, 'Hello_1');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:Hello_1');
      logInfo(`${BUNDLE}StartResultLogOf_0158 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0159
     * @tc.name      UIExtensionSamples_StartResultLogOf_0159
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="xHello") returns "resultCode:1bundleName:xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0159 begin`);
      const actual: string = startResultLogOf(1, 'xHello');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:xHello');
      logInfo(`${BUNDLE}StartResultLogOf_0159 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0160
     * @tc.name      UIExtensionSamples_StartResultLogOf_0160
     * @tc.desc      startResultLogOf(resultCode=1, bundleName=" hello world ") returns "resultCode:1bundleName: hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0160 begin`);
      const actual: string = startResultLogOf(1, ' hello world ');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName: hello world ');
      logInfo(`${BUNDLE}StartResultLogOf_0160 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0161
     * @tc.name      UIExtensionSamples_StartResultLogOf_0161
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="hello worldhello world") returns "resultCode:1bundleN...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0161 begin`);
      const actual: string = startResultLogOf(1, 'hello worldhello world');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:hello worldhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0161 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0162
     * @tc.name      UIExtensionSamples_StartResultLogOf_0162
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="hello world_1") returns "resultCode:1bundleName:hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0162 begin`);
      const actual: string = startResultLogOf(1, 'hello world_1');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:hello world_1');
      logInfo(`${BUNDLE}StartResultLogOf_0162 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0163
     * @tc.name      UIExtensionSamples_StartResultLogOf_0163
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="xhello world") returns "resultCode:1bundleName:xhello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0163 begin`);
      const actual: string = startResultLogOf(1, 'xhello world');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:xhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0163 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0164
     * @tc.name      UIExtensionSamples_StartResultLogOf_0164
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="   ") returns "resultCode:1bundleName:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0164 begin`);
      const actual: string = startResultLogOf(1, '   ');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:   ');
      logInfo(`${BUNDLE}StartResultLogOf_0164 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0165
     * @tc.name      UIExtensionSamples_StartResultLogOf_0165
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="  ") returns "resultCode:1bundleName:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0165 begin`);
      const actual: string = startResultLogOf(1, '  ');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:  ');
      logInfo(`${BUNDLE}StartResultLogOf_0165 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0166
     * @tc.name      UIExtensionSamples_StartResultLogOf_0166
     * @tc.desc      startResultLogOf(resultCode=1, bundleName=" _1") returns "resultCode:1bundleName: _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0166 begin`);
      const actual: string = startResultLogOf(1, ' _1');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName: _1');
      logInfo(`${BUNDLE}StartResultLogOf_0166 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0167
     * @tc.name      UIExtensionSamples_StartResultLogOf_0167
     * @tc.desc      startResultLogOf(resultCode=1, bundleName="x ") returns "resultCode:1bundleName:x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0167 begin`);
      const actual: string = startResultLogOf(1, 'x ');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName:x ');
      logInfo(`${BUNDLE}StartResultLogOf_0167 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0168
     * @tc.name      UIExtensionSamples_StartResultLogOf_0168
     * @tc.desc      startResultLogOf(resultCode=1, bundleName=" A ") returns "resultCode:1bundleName: A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0168 begin`);
      const actual: string = startResultLogOf(1, ' A ');
      logInfo(`startResultLogOf(resultCode=1, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:1bundleName: A ');
      logInfo(`${BUNDLE}StartResultLogOf_0168 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0169
     * @tc.name      UIExtensionSamples_StartResultLogOf_0169
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="Hello") returns "resultCode:2bundleName:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0169 begin`);
      const actual: string = startResultLogOf(2, 'Hello');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:Hello');
      logInfo(`${BUNDLE}StartResultLogOf_0169 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0170
     * @tc.name      UIExtensionSamples_StartResultLogOf_0170
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="hello world") returns "resultCode:2bundleName:hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0170 begin`);
      const actual: string = startResultLogOf(2, 'hello world');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:hello world');
      logInfo(`${BUNDLE}StartResultLogOf_0170 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0171
     * @tc.name      UIExtensionSamples_StartResultLogOf_0171
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="") returns "resultCode:2bundleName:"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0171 begin`);
      const actual: string = startResultLogOf(2, '');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:');
      logInfo(`${BUNDLE}StartResultLogOf_0171 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0172
     * @tc.name      UIExtensionSamples_StartResultLogOf_0172
     * @tc.desc      startResultLogOf(resultCode=2, bundleName=" ") returns "resultCode:2bundleName: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0172 begin`);
      const actual: string = startResultLogOf(2, ' ');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName: ');
      logInfo(`${BUNDLE}StartResultLogOf_0172 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0173
     * @tc.name      UIExtensionSamples_StartResultLogOf_0173
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="A") returns "resultCode:2bundleName:A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0173 begin`);
      const actual: string = startResultLogOf(2, 'A');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:A');
      logInfo(`${BUNDLE}StartResultLogOf_0173 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0174
     * @tc.name      UIExtensionSamples_StartResultLogOf_0174
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="Sample Title 123") returns "resultCode:2bundleName:Sa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0174 begin`);
      const actual: string = startResultLogOf(2, 'Sample Title 123');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:Sample Title 123');
      logInfo(`${BUNDLE}StartResultLogOf_0174 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0175
     * @tc.name      UIExtensionSamples_StartResultLogOf_0175
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="??") returns "resultCode:2bundleName:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0175 begin`);
      const actual: string = startResultLogOf(2, '\u4e2d\u6587');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartResultLogOf_0175 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0176
     * @tc.name      UIExtensionSamples_StartResultLogOf_0176
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="a") returns "resultCode:2bundleName:a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0176 begin`);
      const actual: string = startResultLogOf(2, 'a');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:a');
      logInfo(`${BUNDLE}StartResultLogOf_0176 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0177
     * @tc.name      UIExtensionSamples_StartResultLogOf_0177
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="abc") returns "resultCode:2bundleName:abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0177 begin`);
      const actual: string = startResultLogOf(2, 'abc');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:abc');
      logInfo(`${BUNDLE}StartResultLogOf_0177 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0178
     * @tc.name      UIExtensionSamples_StartResultLogOf_0178
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="Hello World") returns "resultCode:2bundleName:Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0178 begin`);
      const actual: string = startResultLogOf(2, 'Hello World');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:Hello World');
      logInfo(`${BUNDLE}StartResultLogOf_0178 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0179
     * @tc.name      UIExtensionSamples_StartResultLogOf_0179
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="123") returns "resultCode:2bundleName:123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0179 begin`);
      const actual: string = startResultLogOf(2, '123');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:123');
      logInfo(`${BUNDLE}StartResultLogOf_0179 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0180
     * @tc.name      UIExtensionSamples_StartResultLogOf_0180
     * @tc.desc      startResultLogOf(resultCode=2, bundleName=" Hello ") returns "resultCode:2bundleName: Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0180 begin`);
      const actual: string = startResultLogOf(2, ' Hello ');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName: Hello ');
      logInfo(`${BUNDLE}StartResultLogOf_0180 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0181
     * @tc.name      UIExtensionSamples_StartResultLogOf_0181
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="HelloHello") returns "resultCode:2bundleName:HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0181 begin`);
      const actual: string = startResultLogOf(2, 'HelloHello');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:HelloHello');
      logInfo(`${BUNDLE}StartResultLogOf_0181 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0182
     * @tc.name      UIExtensionSamples_StartResultLogOf_0182
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="Hello_1") returns "resultCode:2bundleName:Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0182 begin`);
      const actual: string = startResultLogOf(2, 'Hello_1');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:Hello_1');
      logInfo(`${BUNDLE}StartResultLogOf_0182 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0183
     * @tc.name      UIExtensionSamples_StartResultLogOf_0183
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="xHello") returns "resultCode:2bundleName:xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0183 begin`);
      const actual: string = startResultLogOf(2, 'xHello');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:xHello');
      logInfo(`${BUNDLE}StartResultLogOf_0183 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0184
     * @tc.name      UIExtensionSamples_StartResultLogOf_0184
     * @tc.desc      startResultLogOf(resultCode=2, bundleName=" hello world ") returns "resultCode:2bundleName: hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0184 begin`);
      const actual: string = startResultLogOf(2, ' hello world ');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName: hello world ');
      logInfo(`${BUNDLE}StartResultLogOf_0184 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0185
     * @tc.name      UIExtensionSamples_StartResultLogOf_0185
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="hello worldhello world") returns "resultCode:2bundleN...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0185 begin`);
      const actual: string = startResultLogOf(2, 'hello worldhello world');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:hello worldhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0185 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0186
     * @tc.name      UIExtensionSamples_StartResultLogOf_0186
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="hello world_1") returns "resultCode:2bundleName:hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0186 begin`);
      const actual: string = startResultLogOf(2, 'hello world_1');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:hello world_1');
      logInfo(`${BUNDLE}StartResultLogOf_0186 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0187
     * @tc.name      UIExtensionSamples_StartResultLogOf_0187
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="xhello world") returns "resultCode:2bundleName:xhello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0187 begin`);
      const actual: string = startResultLogOf(2, 'xhello world');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:xhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0187 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0188
     * @tc.name      UIExtensionSamples_StartResultLogOf_0188
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="   ") returns "resultCode:2bundleName:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0188 begin`);
      const actual: string = startResultLogOf(2, '   ');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:   ');
      logInfo(`${BUNDLE}StartResultLogOf_0188 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0189
     * @tc.name      UIExtensionSamples_StartResultLogOf_0189
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="  ") returns "resultCode:2bundleName:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0189 begin`);
      const actual: string = startResultLogOf(2, '  ');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:  ');
      logInfo(`${BUNDLE}StartResultLogOf_0189 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0190
     * @tc.name      UIExtensionSamples_StartResultLogOf_0190
     * @tc.desc      startResultLogOf(resultCode=2, bundleName=" _1") returns "resultCode:2bundleName: _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0190 begin`);
      const actual: string = startResultLogOf(2, ' _1');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName: _1');
      logInfo(`${BUNDLE}StartResultLogOf_0190 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0191
     * @tc.name      UIExtensionSamples_StartResultLogOf_0191
     * @tc.desc      startResultLogOf(resultCode=2, bundleName="x ") returns "resultCode:2bundleName:x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0191 begin`);
      const actual: string = startResultLogOf(2, 'x ');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName:x ');
      logInfo(`${BUNDLE}StartResultLogOf_0191 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0192
     * @tc.name      UIExtensionSamples_StartResultLogOf_0192
     * @tc.desc      startResultLogOf(resultCode=2, bundleName=" A ") returns "resultCode:2bundleName: A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0192 begin`);
      const actual: string = startResultLogOf(2, ' A ');
      logInfo(`startResultLogOf(resultCode=2, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:2bundleName: A ');
      logInfo(`${BUNDLE}StartResultLogOf_0192 end`);
    });
  });
}
