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
export default function startResultLogOfTest(): void {
  describe('StartResultLogOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0001
     * @tc.name      UIExtensionSamples_StartResultLogOf_0001
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="Hello") returns "resultCode:0bundleName:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_StartResultLogOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0001 begin`);
      const actual: string = startResultLogOf(0, 'Hello');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:Hello');
      logInfo(`${BUNDLE}StartResultLogOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0002
     * @tc.name      UIExtensionSamples_StartResultLogOf_0002
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="hello world") returns "resultCode:0bundleName:hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_StartResultLogOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0002 begin`);
      const actual: string = startResultLogOf(0, 'hello world');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:hello world');
      logInfo(`${BUNDLE}StartResultLogOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0003
     * @tc.name      UIExtensionSamples_StartResultLogOf_0003
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="") returns "resultCode:0bundleName:"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0003 begin`);
      const actual: string = startResultLogOf(0, '');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:');
      logInfo(`${BUNDLE}StartResultLogOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0004
     * @tc.name      UIExtensionSamples_StartResultLogOf_0004
     * @tc.desc      startResultLogOf(resultCode=0, bundleName=" ") returns "resultCode:0bundleName: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0004 begin`);
      const actual: string = startResultLogOf(0, ' ');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName: ');
      logInfo(`${BUNDLE}StartResultLogOf_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0005
     * @tc.name      UIExtensionSamples_StartResultLogOf_0005
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="A") returns "resultCode:0bundleName:A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0005 begin`);
      const actual: string = startResultLogOf(0, 'A');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:A');
      logInfo(`${BUNDLE}StartResultLogOf_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0006
     * @tc.name      UIExtensionSamples_StartResultLogOf_0006
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="Sample Title 123") returns "resultCode:0bundleName:Sa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0006 begin`);
      const actual: string = startResultLogOf(0, 'Sample Title 123');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:Sample Title 123');
      logInfo(`${BUNDLE}StartResultLogOf_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0007
     * @tc.name      UIExtensionSamples_StartResultLogOf_0007
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="??") returns "resultCode:0bundleName:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0007 begin`);
      const actual: string = startResultLogOf(0, '\u4e2d\u6587');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartResultLogOf_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0008
     * @tc.name      UIExtensionSamples_StartResultLogOf_0008
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="a") returns "resultCode:0bundleName:a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0008 begin`);
      const actual: string = startResultLogOf(0, 'a');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:a');
      logInfo(`${BUNDLE}StartResultLogOf_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0009
     * @tc.name      UIExtensionSamples_StartResultLogOf_0009
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="abc") returns "resultCode:0bundleName:abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0009 begin`);
      const actual: string = startResultLogOf(0, 'abc');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:abc');
      logInfo(`${BUNDLE}StartResultLogOf_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0010
     * @tc.name      UIExtensionSamples_StartResultLogOf_0010
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="Hello World") returns "resultCode:0bundleName:Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0010 begin`);
      const actual: string = startResultLogOf(0, 'Hello World');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:Hello World');
      logInfo(`${BUNDLE}StartResultLogOf_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0011
     * @tc.name      UIExtensionSamples_StartResultLogOf_0011
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="123") returns "resultCode:0bundleName:123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0011 begin`);
      const actual: string = startResultLogOf(0, '123');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:123');
      logInfo(`${BUNDLE}StartResultLogOf_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0012
     * @tc.name      UIExtensionSamples_StartResultLogOf_0012
     * @tc.desc      startResultLogOf(resultCode=0, bundleName=" Hello ") returns "resultCode:0bundleName: Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0012 begin`);
      const actual: string = startResultLogOf(0, ' Hello ');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName: Hello ');
      logInfo(`${BUNDLE}StartResultLogOf_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0013
     * @tc.name      UIExtensionSamples_StartResultLogOf_0013
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="HelloHello") returns "resultCode:0bundleName:HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0013 begin`);
      const actual: string = startResultLogOf(0, 'HelloHello');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:HelloHello');
      logInfo(`${BUNDLE}StartResultLogOf_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0014
     * @tc.name      UIExtensionSamples_StartResultLogOf_0014
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="Hello_1") returns "resultCode:0bundleName:Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0014 begin`);
      const actual: string = startResultLogOf(0, 'Hello_1');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:Hello_1');
      logInfo(`${BUNDLE}StartResultLogOf_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0015
     * @tc.name      UIExtensionSamples_StartResultLogOf_0015
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="xHello") returns "resultCode:0bundleName:xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0015 begin`);
      const actual: string = startResultLogOf(0, 'xHello');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:xHello');
      logInfo(`${BUNDLE}StartResultLogOf_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0016
     * @tc.name      UIExtensionSamples_StartResultLogOf_0016
     * @tc.desc      startResultLogOf(resultCode=0, bundleName=" hello world ") returns "resultCode:0bundleName: hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0016 begin`);
      const actual: string = startResultLogOf(0, ' hello world ');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName: hello world ');
      logInfo(`${BUNDLE}StartResultLogOf_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0017
     * @tc.name      UIExtensionSamples_StartResultLogOf_0017
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="hello worldhello world") returns "resultCode:0bundleN...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0017 begin`);
      const actual: string = startResultLogOf(0, 'hello worldhello world');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:hello worldhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0018
     * @tc.name      UIExtensionSamples_StartResultLogOf_0018
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="hello world_1") returns "resultCode:0bundleName:hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0018 begin`);
      const actual: string = startResultLogOf(0, 'hello world_1');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:hello world_1');
      logInfo(`${BUNDLE}StartResultLogOf_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0019
     * @tc.name      UIExtensionSamples_StartResultLogOf_0019
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="xhello world") returns "resultCode:0bundleName:xhello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0019 begin`);
      const actual: string = startResultLogOf(0, 'xhello world');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:xhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0020
     * @tc.name      UIExtensionSamples_StartResultLogOf_0020
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="   ") returns "resultCode:0bundleName:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0020 begin`);
      const actual: string = startResultLogOf(0, '   ');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:   ');
      logInfo(`${BUNDLE}StartResultLogOf_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0021
     * @tc.name      UIExtensionSamples_StartResultLogOf_0021
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="  ") returns "resultCode:0bundleName:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0021 begin`);
      const actual: string = startResultLogOf(0, '  ');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:  ');
      logInfo(`${BUNDLE}StartResultLogOf_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0022
     * @tc.name      UIExtensionSamples_StartResultLogOf_0022
     * @tc.desc      startResultLogOf(resultCode=0, bundleName=" _1") returns "resultCode:0bundleName: _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0022 begin`);
      const actual: string = startResultLogOf(0, ' _1');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName: _1');
      logInfo(`${BUNDLE}StartResultLogOf_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0023
     * @tc.name      UIExtensionSamples_StartResultLogOf_0023
     * @tc.desc      startResultLogOf(resultCode=0, bundleName="x ") returns "resultCode:0bundleName:x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0023 begin`);
      const actual: string = startResultLogOf(0, 'x ');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName:x ');
      logInfo(`${BUNDLE}StartResultLogOf_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0024
     * @tc.name      UIExtensionSamples_StartResultLogOf_0024
     * @tc.desc      startResultLogOf(resultCode=0, bundleName=" A ") returns "resultCode:0bundleName: A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0024 begin`);
      const actual: string = startResultLogOf(0, ' A ');
      logInfo(`startResultLogOf(resultCode=0, bundleName...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:0bundleName: A ');
      logInfo(`${BUNDLE}StartResultLogOf_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0025
     * @tc.name      UIExtensionSamples_StartResultLogOf_0025
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="Hello") returns "resultCode:200bundleName:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0025 begin`);
      const actual: string = startResultLogOf(200, 'Hello');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:Hello');
      logInfo(`${BUNDLE}StartResultLogOf_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0026
     * @tc.name      UIExtensionSamples_StartResultLogOf_0026
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="hello world") returns "resultCode:200bundleName:hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0026 begin`);
      const actual: string = startResultLogOf(200, 'hello world');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:hello world');
      logInfo(`${BUNDLE}StartResultLogOf_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0027
     * @tc.name      UIExtensionSamples_StartResultLogOf_0027
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="") returns "resultCode:200bundleName:"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0027 begin`);
      const actual: string = startResultLogOf(200, '');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:');
      logInfo(`${BUNDLE}StartResultLogOf_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0028
     * @tc.name      UIExtensionSamples_StartResultLogOf_0028
     * @tc.desc      startResultLogOf(resultCode=200, bundleName=" ") returns "resultCode:200bundleName: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0028 begin`);
      const actual: string = startResultLogOf(200, ' ');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName: ');
      logInfo(`${BUNDLE}StartResultLogOf_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0029
     * @tc.name      UIExtensionSamples_StartResultLogOf_0029
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="A") returns "resultCode:200bundleName:A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0029 begin`);
      const actual: string = startResultLogOf(200, 'A');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:A');
      logInfo(`${BUNDLE}StartResultLogOf_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0030
     * @tc.name      UIExtensionSamples_StartResultLogOf_0030
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="Sample Title 123") returns "resultCode:200bundleNam...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0030 begin`);
      const actual: string = startResultLogOf(200, 'Sample Title 123');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:Sample Title 123');
      logInfo(`${BUNDLE}StartResultLogOf_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0031
     * @tc.name      UIExtensionSamples_StartResultLogOf_0031
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="??") returns "resultCode:200bundleName:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0031 begin`);
      const actual: string = startResultLogOf(200, '\u4e2d\u6587');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartResultLogOf_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0032
     * @tc.name      UIExtensionSamples_StartResultLogOf_0032
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="a") returns "resultCode:200bundleName:a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0032 begin`);
      const actual: string = startResultLogOf(200, 'a');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:a');
      logInfo(`${BUNDLE}StartResultLogOf_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0033
     * @tc.name      UIExtensionSamples_StartResultLogOf_0033
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="abc") returns "resultCode:200bundleName:abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0033 begin`);
      const actual: string = startResultLogOf(200, 'abc');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:abc');
      logInfo(`${BUNDLE}StartResultLogOf_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0034
     * @tc.name      UIExtensionSamples_StartResultLogOf_0034
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="Hello World") returns "resultCode:200bundleName:Hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0034 begin`);
      const actual: string = startResultLogOf(200, 'Hello World');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:Hello World');
      logInfo(`${BUNDLE}StartResultLogOf_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0035
     * @tc.name      UIExtensionSamples_StartResultLogOf_0035
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="123") returns "resultCode:200bundleName:123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0035 begin`);
      const actual: string = startResultLogOf(200, '123');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:123');
      logInfo(`${BUNDLE}StartResultLogOf_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0036
     * @tc.name      UIExtensionSamples_StartResultLogOf_0036
     * @tc.desc      startResultLogOf(resultCode=200, bundleName=" Hello ") returns "resultCode:200bundleName: Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0036 begin`);
      const actual: string = startResultLogOf(200, ' Hello ');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName: Hello ');
      logInfo(`${BUNDLE}StartResultLogOf_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0037
     * @tc.name      UIExtensionSamples_StartResultLogOf_0037
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="HelloHello") returns "resultCode:200bundleName:Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0037 begin`);
      const actual: string = startResultLogOf(200, 'HelloHello');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:HelloHello');
      logInfo(`${BUNDLE}StartResultLogOf_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0038
     * @tc.name      UIExtensionSamples_StartResultLogOf_0038
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="Hello_1") returns "resultCode:200bundleName:Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0038 begin`);
      const actual: string = startResultLogOf(200, 'Hello_1');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:Hello_1');
      logInfo(`${BUNDLE}StartResultLogOf_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0039
     * @tc.name      UIExtensionSamples_StartResultLogOf_0039
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="xHello") returns "resultCode:200bundleName:xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0039 begin`);
      const actual: string = startResultLogOf(200, 'xHello');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:xHello');
      logInfo(`${BUNDLE}StartResultLogOf_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0040
     * @tc.name      UIExtensionSamples_StartResultLogOf_0040
     * @tc.desc      startResultLogOf(resultCode=200, bundleName=" hello world ") returns "resultCode:200bundleName: ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0040 begin`);
      const actual: string = startResultLogOf(200, ' hello world ');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName: hello world ');
      logInfo(`${BUNDLE}StartResultLogOf_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0041
     * @tc.name      UIExtensionSamples_StartResultLogOf_0041
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="hello worldhello world") returns "resultCode:200bun...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0041 begin`);
      const actual: string = startResultLogOf(200, 'hello worldhello world');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:hello worldhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0042
     * @tc.name      UIExtensionSamples_StartResultLogOf_0042
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="hello world_1") returns "resultCode:200bundleName:h...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0042 begin`);
      const actual: string = startResultLogOf(200, 'hello world_1');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:hello world_1');
      logInfo(`${BUNDLE}StartResultLogOf_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0043
     * @tc.name      UIExtensionSamples_StartResultLogOf_0043
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="xhello world") returns "resultCode:200bundleName:xh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0043 begin`);
      const actual: string = startResultLogOf(200, 'xhello world');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:xhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0044
     * @tc.name      UIExtensionSamples_StartResultLogOf_0044
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="   ") returns "resultCode:200bundleName:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0044 begin`);
      const actual: string = startResultLogOf(200, '   ');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:   ');
      logInfo(`${BUNDLE}StartResultLogOf_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0045
     * @tc.name      UIExtensionSamples_StartResultLogOf_0045
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="  ") returns "resultCode:200bundleName:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0045 begin`);
      const actual: string = startResultLogOf(200, '  ');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:  ');
      logInfo(`${BUNDLE}StartResultLogOf_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0046
     * @tc.name      UIExtensionSamples_StartResultLogOf_0046
     * @tc.desc      startResultLogOf(resultCode=200, bundleName=" _1") returns "resultCode:200bundleName: _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0046 begin`);
      const actual: string = startResultLogOf(200, ' _1');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName: _1');
      logInfo(`${BUNDLE}StartResultLogOf_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0047
     * @tc.name      UIExtensionSamples_StartResultLogOf_0047
     * @tc.desc      startResultLogOf(resultCode=200, bundleName="x ") returns "resultCode:200bundleName:x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0047 begin`);
      const actual: string = startResultLogOf(200, 'x ');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName:x ');
      logInfo(`${BUNDLE}StartResultLogOf_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0048
     * @tc.name      UIExtensionSamples_StartResultLogOf_0048
     * @tc.desc      startResultLogOf(resultCode=200, bundleName=" A ") returns "resultCode:200bundleName: A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0048 begin`);
      const actual: string = startResultLogOf(200, ' A ');
      logInfo(`startResultLogOf(resultCode=200, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:200bundleName: A ');
      logInfo(`${BUNDLE}StartResultLogOf_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0049
     * @tc.name      UIExtensionSamples_StartResultLogOf_0049
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="Hello") returns "resultCode:401bundleName:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0049 begin`);
      const actual: string = startResultLogOf(401, 'Hello');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:Hello');
      logInfo(`${BUNDLE}StartResultLogOf_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0050
     * @tc.name      UIExtensionSamples_StartResultLogOf_0050
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="hello world") returns "resultCode:401bundleName:hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0050 begin`);
      const actual: string = startResultLogOf(401, 'hello world');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:hello world');
      logInfo(`${BUNDLE}StartResultLogOf_0050 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0051
     * @tc.name      UIExtensionSamples_StartResultLogOf_0051
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="") returns "resultCode:401bundleName:"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0051 begin`);
      const actual: string = startResultLogOf(401, '');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:');
      logInfo(`${BUNDLE}StartResultLogOf_0051 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0052
     * @tc.name      UIExtensionSamples_StartResultLogOf_0052
     * @tc.desc      startResultLogOf(resultCode=401, bundleName=" ") returns "resultCode:401bundleName: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0052 begin`);
      const actual: string = startResultLogOf(401, ' ');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName: ');
      logInfo(`${BUNDLE}StartResultLogOf_0052 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0053
     * @tc.name      UIExtensionSamples_StartResultLogOf_0053
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="A") returns "resultCode:401bundleName:A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0053 begin`);
      const actual: string = startResultLogOf(401, 'A');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:A');
      logInfo(`${BUNDLE}StartResultLogOf_0053 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0054
     * @tc.name      UIExtensionSamples_StartResultLogOf_0054
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="Sample Title 123") returns "resultCode:401bundleNam...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0054 begin`);
      const actual: string = startResultLogOf(401, 'Sample Title 123');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:Sample Title 123');
      logInfo(`${BUNDLE}StartResultLogOf_0054 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0055
     * @tc.name      UIExtensionSamples_StartResultLogOf_0055
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="??") returns "resultCode:401bundleName:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0055 begin`);
      const actual: string = startResultLogOf(401, '\u4e2d\u6587');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartResultLogOf_0055 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0056
     * @tc.name      UIExtensionSamples_StartResultLogOf_0056
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="a") returns "resultCode:401bundleName:a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0056 begin`);
      const actual: string = startResultLogOf(401, 'a');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:a');
      logInfo(`${BUNDLE}StartResultLogOf_0056 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0057
     * @tc.name      UIExtensionSamples_StartResultLogOf_0057
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="abc") returns "resultCode:401bundleName:abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0057 begin`);
      const actual: string = startResultLogOf(401, 'abc');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:abc');
      logInfo(`${BUNDLE}StartResultLogOf_0057 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0058
     * @tc.name      UIExtensionSamples_StartResultLogOf_0058
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="Hello World") returns "resultCode:401bundleName:Hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0058 begin`);
      const actual: string = startResultLogOf(401, 'Hello World');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:Hello World');
      logInfo(`${BUNDLE}StartResultLogOf_0058 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0059
     * @tc.name      UIExtensionSamples_StartResultLogOf_0059
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="123") returns "resultCode:401bundleName:123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0059 begin`);
      const actual: string = startResultLogOf(401, '123');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:123');
      logInfo(`${BUNDLE}StartResultLogOf_0059 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0060
     * @tc.name      UIExtensionSamples_StartResultLogOf_0060
     * @tc.desc      startResultLogOf(resultCode=401, bundleName=" Hello ") returns "resultCode:401bundleName: Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0060 begin`);
      const actual: string = startResultLogOf(401, ' Hello ');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName: Hello ');
      logInfo(`${BUNDLE}StartResultLogOf_0060 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0061
     * @tc.name      UIExtensionSamples_StartResultLogOf_0061
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="HelloHello") returns "resultCode:401bundleName:Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0061 begin`);
      const actual: string = startResultLogOf(401, 'HelloHello');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:HelloHello');
      logInfo(`${BUNDLE}StartResultLogOf_0061 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0062
     * @tc.name      UIExtensionSamples_StartResultLogOf_0062
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="Hello_1") returns "resultCode:401bundleName:Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0062 begin`);
      const actual: string = startResultLogOf(401, 'Hello_1');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:Hello_1');
      logInfo(`${BUNDLE}StartResultLogOf_0062 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0063
     * @tc.name      UIExtensionSamples_StartResultLogOf_0063
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="xHello") returns "resultCode:401bundleName:xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0063 begin`);
      const actual: string = startResultLogOf(401, 'xHello');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:xHello');
      logInfo(`${BUNDLE}StartResultLogOf_0063 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0064
     * @tc.name      UIExtensionSamples_StartResultLogOf_0064
     * @tc.desc      startResultLogOf(resultCode=401, bundleName=" hello world ") returns "resultCode:401bundleName: ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0064 begin`);
      const actual: string = startResultLogOf(401, ' hello world ');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName: hello world ');
      logInfo(`${BUNDLE}StartResultLogOf_0064 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0065
     * @tc.name      UIExtensionSamples_StartResultLogOf_0065
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="hello worldhello world") returns "resultCode:401bun...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0065 begin`);
      const actual: string = startResultLogOf(401, 'hello worldhello world');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:hello worldhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0065 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0066
     * @tc.name      UIExtensionSamples_StartResultLogOf_0066
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="hello world_1") returns "resultCode:401bundleName:h...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0066 begin`);
      const actual: string = startResultLogOf(401, 'hello world_1');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:hello world_1');
      logInfo(`${BUNDLE}StartResultLogOf_0066 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0067
     * @tc.name      UIExtensionSamples_StartResultLogOf_0067
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="xhello world") returns "resultCode:401bundleName:xh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0067 begin`);
      const actual: string = startResultLogOf(401, 'xhello world');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:xhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0067 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0068
     * @tc.name      UIExtensionSamples_StartResultLogOf_0068
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="   ") returns "resultCode:401bundleName:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0068 begin`);
      const actual: string = startResultLogOf(401, '   ');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:   ');
      logInfo(`${BUNDLE}StartResultLogOf_0068 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0069
     * @tc.name      UIExtensionSamples_StartResultLogOf_0069
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="  ") returns "resultCode:401bundleName:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0069 begin`);
      const actual: string = startResultLogOf(401, '  ');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:  ');
      logInfo(`${BUNDLE}StartResultLogOf_0069 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0070
     * @tc.name      UIExtensionSamples_StartResultLogOf_0070
     * @tc.desc      startResultLogOf(resultCode=401, bundleName=" _1") returns "resultCode:401bundleName: _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0070 begin`);
      const actual: string = startResultLogOf(401, ' _1');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName: _1');
      logInfo(`${BUNDLE}StartResultLogOf_0070 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0071
     * @tc.name      UIExtensionSamples_StartResultLogOf_0071
     * @tc.desc      startResultLogOf(resultCode=401, bundleName="x ") returns "resultCode:401bundleName:x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0071 begin`);
      const actual: string = startResultLogOf(401, 'x ');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName:x ');
      logInfo(`${BUNDLE}StartResultLogOf_0071 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0072
     * @tc.name      UIExtensionSamples_StartResultLogOf_0072
     * @tc.desc      startResultLogOf(resultCode=401, bundleName=" A ") returns "resultCode:401bundleName: A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0072 begin`);
      const actual: string = startResultLogOf(401, ' A ');
      logInfo(`startResultLogOf(resultCode=401, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:401bundleName: A ');
      logInfo(`${BUNDLE}StartResultLogOf_0072 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0073
     * @tc.name      UIExtensionSamples_StartResultLogOf_0073
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="Hello") returns "resultCode:404bundleName:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0073 begin`);
      const actual: string = startResultLogOf(404, 'Hello');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:Hello');
      logInfo(`${BUNDLE}StartResultLogOf_0073 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0074
     * @tc.name      UIExtensionSamples_StartResultLogOf_0074
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="hello world") returns "resultCode:404bundleName:hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0074 begin`);
      const actual: string = startResultLogOf(404, 'hello world');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:hello world');
      logInfo(`${BUNDLE}StartResultLogOf_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0075
     * @tc.name      UIExtensionSamples_StartResultLogOf_0075
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="") returns "resultCode:404bundleName:"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0075 begin`);
      const actual: string = startResultLogOf(404, '');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:');
      logInfo(`${BUNDLE}StartResultLogOf_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0076
     * @tc.name      UIExtensionSamples_StartResultLogOf_0076
     * @tc.desc      startResultLogOf(resultCode=404, bundleName=" ") returns "resultCode:404bundleName: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0076 begin`);
      const actual: string = startResultLogOf(404, ' ');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName: ');
      logInfo(`${BUNDLE}StartResultLogOf_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0077
     * @tc.name      UIExtensionSamples_StartResultLogOf_0077
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="A") returns "resultCode:404bundleName:A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0077 begin`);
      const actual: string = startResultLogOf(404, 'A');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:A');
      logInfo(`${BUNDLE}StartResultLogOf_0077 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0078
     * @tc.name      UIExtensionSamples_StartResultLogOf_0078
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="Sample Title 123") returns "resultCode:404bundleNam...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0078 begin`);
      const actual: string = startResultLogOf(404, 'Sample Title 123');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:Sample Title 123');
      logInfo(`${BUNDLE}StartResultLogOf_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0079
     * @tc.name      UIExtensionSamples_StartResultLogOf_0079
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="??") returns "resultCode:404bundleName:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0079 begin`);
      const actual: string = startResultLogOf(404, '\u4e2d\u6587');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartResultLogOf_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0080
     * @tc.name      UIExtensionSamples_StartResultLogOf_0080
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="a") returns "resultCode:404bundleName:a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0080 begin`);
      const actual: string = startResultLogOf(404, 'a');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:a');
      logInfo(`${BUNDLE}StartResultLogOf_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0081
     * @tc.name      UIExtensionSamples_StartResultLogOf_0081
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="abc") returns "resultCode:404bundleName:abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0081 begin`);
      const actual: string = startResultLogOf(404, 'abc');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:abc');
      logInfo(`${BUNDLE}StartResultLogOf_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0082
     * @tc.name      UIExtensionSamples_StartResultLogOf_0082
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="Hello World") returns "resultCode:404bundleName:Hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0082 begin`);
      const actual: string = startResultLogOf(404, 'Hello World');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:Hello World');
      logInfo(`${BUNDLE}StartResultLogOf_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0083
     * @tc.name      UIExtensionSamples_StartResultLogOf_0083
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="123") returns "resultCode:404bundleName:123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0083 begin`);
      const actual: string = startResultLogOf(404, '123');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:123');
      logInfo(`${BUNDLE}StartResultLogOf_0083 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0084
     * @tc.name      UIExtensionSamples_StartResultLogOf_0084
     * @tc.desc      startResultLogOf(resultCode=404, bundleName=" Hello ") returns "resultCode:404bundleName: Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0084 begin`);
      const actual: string = startResultLogOf(404, ' Hello ');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName: Hello ');
      logInfo(`${BUNDLE}StartResultLogOf_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0085
     * @tc.name      UIExtensionSamples_StartResultLogOf_0085
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="HelloHello") returns "resultCode:404bundleName:Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0085 begin`);
      const actual: string = startResultLogOf(404, 'HelloHello');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:HelloHello');
      logInfo(`${BUNDLE}StartResultLogOf_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0086
     * @tc.name      UIExtensionSamples_StartResultLogOf_0086
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="Hello_1") returns "resultCode:404bundleName:Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0086 begin`);
      const actual: string = startResultLogOf(404, 'Hello_1');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:Hello_1');
      logInfo(`${BUNDLE}StartResultLogOf_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0087
     * @tc.name      UIExtensionSamples_StartResultLogOf_0087
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="xHello") returns "resultCode:404bundleName:xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0087 begin`);
      const actual: string = startResultLogOf(404, 'xHello');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:xHello');
      logInfo(`${BUNDLE}StartResultLogOf_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0088
     * @tc.name      UIExtensionSamples_StartResultLogOf_0088
     * @tc.desc      startResultLogOf(resultCode=404, bundleName=" hello world ") returns "resultCode:404bundleName: ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0088 begin`);
      const actual: string = startResultLogOf(404, ' hello world ');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName: hello world ');
      logInfo(`${BUNDLE}StartResultLogOf_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0089
     * @tc.name      UIExtensionSamples_StartResultLogOf_0089
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="hello worldhello world") returns "resultCode:404bun...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0089 begin`);
      const actual: string = startResultLogOf(404, 'hello worldhello world');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:hello worldhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0089 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0090
     * @tc.name      UIExtensionSamples_StartResultLogOf_0090
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="hello world_1") returns "resultCode:404bundleName:h...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0090 begin`);
      const actual: string = startResultLogOf(404, 'hello world_1');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:hello world_1');
      logInfo(`${BUNDLE}StartResultLogOf_0090 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0091
     * @tc.name      UIExtensionSamples_StartResultLogOf_0091
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="xhello world") returns "resultCode:404bundleName:xh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0091 begin`);
      const actual: string = startResultLogOf(404, 'xhello world');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:xhello world');
      logInfo(`${BUNDLE}StartResultLogOf_0091 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0092
     * @tc.name      UIExtensionSamples_StartResultLogOf_0092
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="   ") returns "resultCode:404bundleName:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0092 begin`);
      const actual: string = startResultLogOf(404, '   ');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:   ');
      logInfo(`${BUNDLE}StartResultLogOf_0092 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0093
     * @tc.name      UIExtensionSamples_StartResultLogOf_0093
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="  ") returns "resultCode:404bundleName:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0093 begin`);
      const actual: string = startResultLogOf(404, '  ');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:  ');
      logInfo(`${BUNDLE}StartResultLogOf_0093 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0094
     * @tc.name      UIExtensionSamples_StartResultLogOf_0094
     * @tc.desc      startResultLogOf(resultCode=404, bundleName=" _1") returns "resultCode:404bundleName: _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartResultLogOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0094 begin`);
      const actual: string = startResultLogOf(404, ' _1');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName: _1');
      logInfo(`${BUNDLE}StartResultLogOf_0094 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0095
     * @tc.name      UIExtensionSamples_StartResultLogOf_0095
     * @tc.desc      startResultLogOf(resultCode=404, bundleName="x ") returns "resultCode:404bundleName:x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0095 begin`);
      const actual: string = startResultLogOf(404, 'x ');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName:x ');
      logInfo(`${BUNDLE}StartResultLogOf_0095 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_RESULT_LOG_OF_0096
     * @tc.name      UIExtensionSamples_StartResultLogOf_0096
     * @tc.desc      startResultLogOf(resultCode=404, bundleName=" A ") returns "resultCode:404bundleName: A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartResultLogOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartResultLogOf_0096 begin`);
      const actual: string = startResultLogOf(404, ' A ');
      logInfo(`startResultLogOf(resultCode=404, bundleNa...: actual=${actual}`);
      expect(actual).assertEqual('resultCode:404bundleName: A ');
      logInfo(`${BUNDLE}StartResultLogOf_0096 end`);
    });
  });
}
