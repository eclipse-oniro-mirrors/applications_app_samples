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

/** Logic checks for startResultLogOf (30 cases). */
export default function startResultLogOf3Test(): void {
  describe('StartResultLogOf3Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0193
     * @tc.name      UIExtensionSamples_StartResultLogOf_0193
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="Hello") returns "resultCode:3bundleName:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0193 begin`);
      const actual: string = startResultLogOf(3, 'Hello');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:Hello');
      logInfo(`${BUNDLE}StartResultLogOf_0193 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0194
     * @tc.name      UIExtensionSamples_StartResultLogOf_0194
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="hello world") returns "resultCode:3bundleName:hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0194 begin`);
      const actual: string = startResultLogOf(3, 'hello world');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:hello world');
      logInfo(`${BUNDLE}StartResultLogOf_0194 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0195
     * @tc.name      UIExtensionSamples_StartResultLogOf_0195
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="") returns "resultCode:3bundleName:"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0195 begin`);
      const actual: string = startResultLogOf(3, '');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:');
      logInfo(`${BUNDLE}StartResultLogOf_0195 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0196
     * @tc.name      UIExtensionSamples_StartResultLogOf_0196
     * @tc.desc      startResultLogOf(resultCode=3, bundleName=" ") returns "resultCode:3bundleName: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0196 begin`);
      const actual: string = startResultLogOf(3, ' ');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName: ');
      logInfo(`${BUNDLE}StartResultLogOf_0196 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0197
     * @tc.name      UIExtensionSamples_StartResultLogOf_0197
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="A") returns "resultCode:3bundleName:A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0197 begin`);
      const actual: string = startResultLogOf(3, 'A');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:A');
      logInfo(`${BUNDLE}StartResultLogOf_0197 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0198
     * @tc.name      UIExtensionSamples_StartResultLogOf_0198
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="Sample Title 123") returns "resultCode:3bundleName:Sa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0198 begin`);
      const actual: string = startResultLogOf(3, 'Sample Title 123');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:Sample Title 123');
      logInfo(`${BUNDLE}StartResultLogOf_0198 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0199
     * @tc.name      UIExtensionSamples_StartResultLogOf_0199
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="??") returns "resultCode:3bundleName:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0199 begin`);
      const actual: string = startResultLogOf(3, '\u4e2d\u6587');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartResultLogOf_0199 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0200
     * @tc.name      UIExtensionSamples_StartResultLogOf_0200
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="a") returns "resultCode:3bundleName:a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0200 begin`);
      const actual: string = startResultLogOf(3, 'a');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:a');
      logInfo(`${BUNDLE}StartResultLogOf_0200 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0201
     * @tc.name      UIExtensionSamples_StartResultLogOf_0201
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="abc") returns "resultCode:3bundleName:abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0201 begin`);
      const actual: string = startResultLogOf(3, 'abc');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:abc');
      logInfo(`${BUNDLE}StartResultLogOf_0201 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0202
     * @tc.name      UIExtensionSamples_StartResultLogOf_0202
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="Hello World") returns "resultCode:3bundleName:Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0202 begin`);
      const actual: string = startResultLogOf(3, 'Hello World');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:Hello World');
      logInfo(`${BUNDLE}StartResultLogOf_0202 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0203
     * @tc.name      UIExtensionSamples_StartResultLogOf_0203
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="123") returns "resultCode:3bundleName:123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0203 begin`);
      const actual: string = startResultLogOf(3, '123');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:123');
      logInfo(`${BUNDLE}StartResultLogOf_0203 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0204
     * @tc.name      UIExtensionSamples_StartResultLogOf_0204
     * @tc.desc      startResultLogOf(resultCode=3, bundleName=" Hello ") returns "resultCode:3bundleName: Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0204 begin`);
      const actual: string = startResultLogOf(3, ' Hello ');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName: Hello ');
      logInfo(`${BUNDLE}StartResultLogOf_0204 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0205
     * @tc.name      UIExtensionSamples_StartResultLogOf_0205
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="HelloHello") returns "resultCode:3bundleName:HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0205 begin`);
      const actual: string = startResultLogOf(3, 'HelloHello');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:HelloHello');
      logInfo(`${BUNDLE}StartResultLogOf_0205 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0206
     * @tc.name      UIExtensionSamples_StartResultLogOf_0206
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="Hello_1") returns "resultCode:3bundleName:Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0206 begin`);
      const actual: string = startResultLogOf(3, 'Hello_1');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:Hello_1');
      logInfo(`${BUNDLE}StartResultLogOf_0206 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0207
     * @tc.name      UIExtensionSamples_StartResultLogOf_0207
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="xHello") returns "resultCode:3bundleName:xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0207 begin`);
      const actual: string = startResultLogOf(3, 'xHello');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:xHello');
      logInfo(`${BUNDLE}StartResultLogOf_0207 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0208
     * @tc.name      UIExtensionSamples_StartResultLogOf_0208
     * @tc.desc      startResultLogOf(resultCode=3, bundleName=" hello world ") returns "resultCode:3bundleName: hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0208 begin`);
      const actual: string = startResultLogOf(3, ' hello world ');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName: hello world ');
      logInfo(`${BUNDLE}StartResultLogOf_0208 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0209
     * @tc.name      UIExtensionSamples_StartResultLogOf_0209
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="hello worldhello world") returns "resultCode:3bundleN...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0209 begin`);
      const actual: string = startResultLogOf(3, 'hello worldhello world');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:hello worldhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0209 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0210
     * @tc.name      UIExtensionSamples_StartResultLogOf_0210
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="hello world_1") returns "resultCode:3bundleName:hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0210 begin`);
      const actual: string = startResultLogOf(3, 'hello world_1');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:hello world_1');
      logInfo(`${BUNDLE}StartResultLogOf_0210 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0211
     * @tc.name      UIExtensionSamples_StartResultLogOf_0211
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="xhello world") returns "resultCode:3bundleName:xhello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0211 begin`);
      const actual: string = startResultLogOf(3, 'xhello world');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:xhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0211 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0212
     * @tc.name      UIExtensionSamples_StartResultLogOf_0212
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="   ") returns "resultCode:3bundleName:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0212 begin`);
      const actual: string = startResultLogOf(3, '   ');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:   ');
      logInfo(`${BUNDLE}StartResultLogOf_0212 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0213
     * @tc.name      UIExtensionSamples_StartResultLogOf_0213
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="  ") returns "resultCode:3bundleName:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0213 begin`);
      const actual: string = startResultLogOf(3, '  ');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:  ');
      logInfo(`${BUNDLE}StartResultLogOf_0213 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0214
     * @tc.name      UIExtensionSamples_StartResultLogOf_0214
     * @tc.desc      startResultLogOf(resultCode=3, bundleName=" _1") returns "resultCode:3bundleName: _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0214 begin`);
      const actual: string = startResultLogOf(3, ' _1');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName: _1');
      logInfo(`${BUNDLE}StartResultLogOf_0214 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0215
     * @tc.name      UIExtensionSamples_StartResultLogOf_0215
     * @tc.desc      startResultLogOf(resultCode=3, bundleName="x ") returns "resultCode:3bundleName:x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0215 begin`);
      const actual: string = startResultLogOf(3, 'x ');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName:x ');
      logInfo(`${BUNDLE}StartResultLogOf_0215 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0216
     * @tc.name      UIExtensionSamples_StartResultLogOf_0216
     * @tc.desc      startResultLogOf(resultCode=3, bundleName=" A ") returns "resultCode:3bundleName: A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0216 begin`);
      const actual: string = startResultLogOf(3, ' A ');
      logInfo(`startResultLogOf(resultCode=3, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:3bundleName: A ');
      logInfo(`${BUNDLE}StartResultLogOf_0216 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0217
     * @tc.name      UIExtensionSamples_StartResultLogOf_0217
     * @tc.desc      startResultLogOf(resultCode=10, bundleName="Hello") returns "resultCode:10bundleName:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0217 begin`);
      const actual: string = startResultLogOf(10, 'Hello');
      logInfo(`startResultLogOf(resultCode=10, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:10bundleName:Hello');
      logInfo(`${BUNDLE}StartResultLogOf_0217 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0218
     * @tc.name      UIExtensionSamples_StartResultLogOf_0218
     * @tc.desc      startResultLogOf(resultCode=10, bundleName="hello world") returns "resultCode:10bundleName:hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0218 begin`);
      const actual: string = startResultLogOf(10, 'hello world');
      logInfo(`startResultLogOf(resultCode=10, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:10bundleName:hello world');
      logInfo(`${BUNDLE}StartResultLogOf_0218 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0219
     * @tc.name      UIExtensionSamples_StartResultLogOf_0219
     * @tc.desc      startResultLogOf(resultCode=10, bundleName="") returns "resultCode:10bundleName:"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0219 begin`);
      const actual: string = startResultLogOf(10, '');
      logInfo(`startResultLogOf(resultCode=10, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:10bundleName:');
      logInfo(`${BUNDLE}StartResultLogOf_0219 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0220
     * @tc.name      UIExtensionSamples_StartResultLogOf_0220
     * @tc.desc      startResultLogOf(resultCode=10, bundleName=" ") returns "resultCode:10bundleName: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0220 begin`);
      const actual: string = startResultLogOf(10, ' ');
      logInfo(`startResultLogOf(resultCode=10, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:10bundleName: ');
      logInfo(`${BUNDLE}StartResultLogOf_0220 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0221
     * @tc.name      UIExtensionSamples_StartResultLogOf_0221
     * @tc.desc      startResultLogOf(resultCode=10, bundleName="A") returns "resultCode:10bundleName:A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0221 begin`);
      const actual: string = startResultLogOf(10, 'A');
      logInfo(`startResultLogOf(resultCode=10, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:10bundleName:A');
      logInfo(`${BUNDLE}StartResultLogOf_0221 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0222
     * @tc.name      UIExtensionSamples_StartResultLogOf_0222
     * @tc.desc      startResultLogOf(resultCode=10, bundleName="Sample Title 123") returns "resultCode:10bundleName:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0222 begin`);
      const actual: string = startResultLogOf(10, 'Sample Title 123');
      logInfo(`startResultLogOf(resultCode=10, bundleNam...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:10bundleName:Sample Title 123');
      logInfo(`${BUNDLE}StartResultLogOf_0222 end`);
    });
  });
}
