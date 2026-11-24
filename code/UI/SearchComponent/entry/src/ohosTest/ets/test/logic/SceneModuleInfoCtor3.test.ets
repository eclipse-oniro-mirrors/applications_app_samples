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
import { yieldToEventLoop } from '../../utils/TestScheduler';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SceneModuleInfo } from '../../../../main/ets/bridge/SearchComponentBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new SceneModuleInfo (10 cases). */
export default function sceneModuleInfoCtor3Test(): void {
  describe('SceneModuleInfoCtor3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0103
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0103
     * @tc.desc      new SceneModuleInfo(" ", "not a url", " a ", 10, 2) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0103 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'not a url', ' a ', 10, 2);
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('not a url');
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0104
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0104
     * @tc.desc      new SceneModuleInfo("", "", " ", 100, -1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0104 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('', '', ' ', 100, -1);
      logInfo(`new SceneModuleInfo("", "", " ", 100, -1): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new SceneModuleInfo("", "", " ", 100, -1): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('');
      logInfo(`new SceneModuleInfo("", "", " ", 100, -1): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("", "", " ", 100, -1): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("", "", " ", 100, -1): subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' ');
      logInfo(`new SceneModuleInfo("", "", " ", 100, -1): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("", "", " ", 100, -1): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("", "", " ", 100, -1): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0105
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0105
     * @tc.desc      new SceneModuleInfo("??", "file://media/Photo/1/IMG_1.jpg", " a ", -1, 0) initialises 8 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0105 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('\u4e2d\u6587', 'file://media/Photo/1/IMG_1.jpg', ' a ', -1,
        0);
      logInfo(`new SceneModuleInfo("??", "file://media/P...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587');
      logInfo(`new SceneModuleInfo("??", "file://media/P...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new SceneModuleInfo("??", "file://media/P...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "file://media/P...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("??", "file://media/P...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("??", "file://media/P...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("??", "file://media/P...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "file://media/P...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0106
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0106
     * @tc.desc      new SceneModuleInfo(" ", "http://example.com/a.mp3", " a ", 3, 0) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0106 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'http://example.com/a.mp3', ' a ', 3, 0);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0107
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0107
     * @tc.desc      new SceneModuleInfo("", "http://example.com/a.mp3", " a ", 5, 2) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0107 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('', 'http://example.com/a.mp3', ' a ', 5, 2);
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0108
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0108
     * @tc.desc      new SceneModuleInfo("??", "http://example.com/a.mp3", "123", 0, 10) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0108 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('\u4e2d\u6587', 'http://example.com/a.mp3', '123', 0, 10);
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587');
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0109
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0109
     * @tc.desc      new SceneModuleInfo("Hello", "a", "123", 1, 1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0109 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'a', '123', 1, 1);
      logInfo(`new SceneModuleInfo("Hello", "a", "123", ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "a", "123", ...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("Hello", "a", "123", ...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", "123", ...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("Hello", "a", "123", ...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("Hello", "a", "123", ...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("Hello", "a", "123", ...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", "123", ...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0110
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0110
     * @tc.desc      new SceneModuleInfo("", "not a url", " a ", 5, -1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0110 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('', 'not a url', ' a ', 5, -1);
      logInfo(`new SceneModuleInfo("", "not a url", " a ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new SceneModuleInfo("", "not a url", " a ...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('not a url');
      logInfo(`new SceneModuleInfo("", "not a url", " a ...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("", "not a url", " a ...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("", "not a url", " a ...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("", "not a url", " a ...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("", "not a url", " a ...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("", "not a url", " a ...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0110 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0111
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0111
     * @tc.desc      new SceneModuleInfo("Hello", "not a url", " ", 3, 0) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0111 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'not a url', ' ', 3, 0);
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('not a url');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' ');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0111 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0112
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0112
     * @tc.desc      new SceneModuleInfo("A", "http://example.com/a.mp3", " a ", 10, 100) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0112 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('A', 'http://example.com/a.mp3', ' a ', 10, 100);
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0112 end`);
    });
  });
}
