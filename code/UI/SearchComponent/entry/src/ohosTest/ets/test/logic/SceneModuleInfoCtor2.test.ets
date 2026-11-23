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

/** Logic checks for new SceneModuleInfo (51 cases). */
export default function sceneModuleInfoCtor2Test(): void {
  describe('SceneModuleInfoCtor2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0052
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0052
     * @tc.desc      new SceneModuleInfo("Hello", "http://example.com/a.mp3", "Hello World", 0, 3) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0052 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'http://example.com/a.mp3', 'Hello World', 0, 3);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('Hello World');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0053
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0053
     * @tc.desc      new SceneModuleInfo("", "a", "123", -1, 100) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0053 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('', 'a', '123', -1, 100);
      logInfo(`new SceneModuleInfo("", "a", "123", -1, 100): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new SceneModuleInfo("", "a", "123", -1, 100): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("", "a", "123", -1, 100): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("", "a", "123", -1, 100): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("", "a", "123", -1, 100): subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("", "a", "123", -1, 100): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("", "a", "123", -1, 100): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("", "a", "123", -1, 100): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0054
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0054
     * @tc.desc      new SceneModuleInfo("??", "", "123", -1, 100) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0054 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('\u4e2d\u6587', '', '123', -1, 100);
      logInfo(`new SceneModuleInfo("??", "", "123", -1, ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587');
      logInfo(`new SceneModuleInfo("??", "", "123", -1, ...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "", "123", -1, ...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "", "123", -1, ...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("??", "", "123", -1, ...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("??", "", "123", -1, ...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("??", "", "123", -1, ...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "", "123", -1, ...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0055
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0055
     * @tc.desc      new SceneModuleInfo("??", "datashare:///media/image/1", "123", 10, 3) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0055 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('\u4e2d\u6587', 'datashare:///media/image/1', '123', 10, 3);
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587');
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0056
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0056
     * @tc.desc      new SceneModuleInfo("A", "https://example.com/media/video.mp4", "abc", 100, 5) initialises 8 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0056 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('A', 'https://example.com/media/video.mp4', 'abc', 100, 5);
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A');
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0057
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0057
     * @tc.desc      new SceneModuleInfo("", "a", "", 100, 0) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0057 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('', 'a', '', 100, 0);
      logInfo(`new SceneModuleInfo("", "a", "", 100, 0): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new SceneModuleInfo("", "a", "", 100, 0): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("", "a", "", 100, 0): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("", "a", "", 100, 0): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("", "a", "", 100, 0): subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("", "a", "", 100, 0): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("", "a", "", 100, 0): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("", "a", "", 100, 0): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0058
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0058
     * @tc.desc      new SceneModuleInfo(" ", "http://example.com/a.mp3", "a", 100, 1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0058 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'http://example.com/a.mp3', 'a', 100, 1);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('a');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0059
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0059
     * @tc.desc      new SceneModuleInfo("", "", "abc", 0, 100) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0059 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('', '', 'abc', 0, 100);
      logInfo(`new SceneModuleInfo("", "", "abc", 0, 100): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new SceneModuleInfo("", "", "abc", 0, 100): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('');
      logInfo(`new SceneModuleInfo("", "", "abc", 0, 100): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("", "", "abc", 0, 100): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("", "", "abc", 0, 100): subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo("", "", "abc", 0, 100): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("", "", "abc", 0, 100): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("", "", "abc", 0, 100): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0060
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0060
     * @tc.desc      new SceneModuleInfo("A", "datashare:///media/image/1", "123", 1, 3) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0060 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('A', 'datashare:///media/image/1', '123', 1, 3);
      logInfo(`new SceneModuleInfo("A", "datashare:///me...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A');
      logInfo(`new SceneModuleInfo("A", "datashare:///me...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("A", "datashare:///me...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "datashare:///me...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("A", "datashare:///me...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("A", "datashare:///me...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("A", "datashare:///me...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "datashare:///me...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0061
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0061
     * @tc.desc      new SceneModuleInfo(" ", "https://example.com/media/video.mp4", " ", -1, -1) initialises 8 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0061 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'https://example.com/media/video.mp4', ' ', -1, -1);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0062
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0062
     * @tc.desc      new SceneModuleInfo(" ", "datashare:///media/image/1", " a ", -1, 3) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0062 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'datashare:///media/image/1', ' a ', -1, 3);
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0063
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0063
     * @tc.desc      new SceneModuleInfo("", "a", "Hello World", 2, 10) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0063 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('', 'a', 'Hello World', 2, 10);
      logInfo(`new SceneModuleInfo("", "a", "Hello World...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new SceneModuleInfo("", "a", "Hello World...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("", "a", "Hello World...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("", "a", "Hello World...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("", "a", "Hello World...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('Hello World');
      logInfo(`new SceneModuleInfo("", "a", "Hello World...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("", "a", "Hello World...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("", "a", "Hello World...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0064
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0064
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 2, 10) initialises 8 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0064 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 2, 10);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0065
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0065
     * @tc.desc      new SceneModuleInfo("hello world", "datashare:///media/image/1", " ", -1, 100) initialises 8 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0065 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('hello world', 'datashare:///media/image/1', ' ', -1, 100);
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' ');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0066
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0066
     * @tc.desc      new SceneModuleInfo("A", "http://example.com/a.mp3", " a ", 0, -1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0066 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('A', 'http://example.com/a.mp3', ' a ', 0, -1);
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0067
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0067
     * @tc.desc      new SceneModuleInfo("A", "http://example.com/a.mp3", "", 1, 10) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0067 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('A', 'http://example.com/a.mp3', '', 1, 10);
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "http://example....: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0068
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0068
     * @tc.desc      new SceneModuleInfo("??", "http://example.com/a.mp3", "Hello World", 1, 5) initialises 8 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0068 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('\u4e2d\u6587', 'http://example.com/a.mp3', 'Hello World', 1,
        5);
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587');
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('Hello World');
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "http://example...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0069
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0069
     * @tc.desc      new SceneModuleInfo("Hello", "a", "Hello World", 5, 100) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0069 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'a', 'Hello World', 5, 100);
      logInfo(`new SceneModuleInfo("Hello", "a", "Hello ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "a", "Hello ...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("Hello", "a", "Hello ...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", "Hello ...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("Hello", "a", "Hello ...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('Hello World');
      logInfo(`new SceneModuleInfo("Hello", "a", "Hello ...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("Hello", "a", "Hello ...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", "Hello ...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0070
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0070
     * @tc.desc      new SceneModuleInfo("hello world", "a", "123", 5, 3) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0070 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('hello world', 'a', '123', 5, 3);
      logInfo(`new SceneModuleInfo("hello world", "a", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new SceneModuleInfo("hello world", "a", "...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("hello world", "a", "...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "a", "...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("hello world", "a", "...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("hello world", "a", "...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("hello world", "a", "...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "a", "...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0071
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0071
     * @tc.desc      new SceneModuleInfo("Hello", "a", " a ", 10, 1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0071 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'a', ' a ', 10, 1);
      logInfo(`new SceneModuleInfo("Hello", "a", " a ", ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "a", " a ", ...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("Hello", "a", " a ", ...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", " a ", ...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("Hello", "a", " a ", ...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("Hello", "a", " a ", ...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("Hello", "a", " a ", ...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", " a ", ...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0072
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0072
     * @tc.desc      new SceneModuleInfo(" ", "a", " a ", 10, 1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0072 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'a', ' a ', 10, 1);
      logInfo(`new SceneModuleInfo(" ", "a", " a ", 10, 1): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "a", " a ", 10, 1): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo(" ", "a", " a ", 10, 1): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "a", " a ", 10, 1): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo(" ", "a", " a ", 10, 1): subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo(" ", "a", " a ", 10, 1): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo(" ", "a", " a ", 10, 1): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "a", " a ", 10, 1): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0073
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0073
     * @tc.desc      new SceneModuleInfo(" ", "", "123", 3, 2) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0073 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', '', '123', 3, 2);
      logInfo(`new SceneModuleInfo(" ", "", "123", 3, 2): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "", "123", 3, 2): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "", "123", 3, 2): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "", "123", 3, 2): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo(" ", "", "123", 3, 2): subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo(" ", "", "123", 3, 2): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo(" ", "", "123", 3, 2): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "", "123", 3, 2): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0074
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0074
     * @tc.desc      new SceneModuleInfo("hello world", "datashare:///media/image/1", " a ", 10, 2) initialises 8 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0074 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('hello world', 'datashare:///media/image/1', ' a ', 10, 2);
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0075
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0075
     * @tc.desc      new SceneModuleInfo(" ", "", " ", 10, -1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0075 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', '', ' ', 10, -1);
      logInfo(`new SceneModuleInfo(" ", "", " ", 10, -1): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "", " ", 10, -1): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "", " ", 10, -1): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "", " ", 10, -1): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo(" ", "", " ", 10, -1): subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "", " ", 10, -1): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo(" ", "", " ", 10, -1): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "", " ", 10, -1): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0076
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0076
     * @tc.desc      new SceneModuleInfo("hello world", "", "abc", 3, 2) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0076 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('hello world', '', 'abc', 3, 2);
      logInfo(`new SceneModuleInfo("hello world", "", "a...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new SceneModuleInfo("hello world", "", "a...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "", "a...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "", "a...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("hello world", "", "a...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo("hello world", "", "a...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("hello world", "", "a...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "", "a...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0077
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0077
     * @tc.desc      new SceneModuleInfo("A", "", " ", 10, 100) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0077 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('A', '', ' ', 10, 100);
      logInfo(`new SceneModuleInfo("A", "", " ", 10, 100): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A');
      logInfo(`new SceneModuleInfo("A", "", " ", 10, 100): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "", " ", 10, 100): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "", " ", 10, 100): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("A", "", " ", 10, 100): subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' ');
      logInfo(`new SceneModuleInfo("A", "", " ", 10, 100): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("A", "", " ", 10, 100): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "", " ", 10, 100): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0077 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0078
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0078
     * @tc.desc      new SceneModuleInfo(" ", "not a url", "123", 100, 5) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0078 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'not a url', '123', 100, 5);
      logInfo(`new SceneModuleInfo(" ", "not a url", "12...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "not a url", "12...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('not a url');
      logInfo(`new SceneModuleInfo(" ", "not a url", "12...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", "12...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo(" ", "not a url", "12...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo(" ", "not a url", "12...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo(" ", "not a url", "12...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", "12...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0079
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0079
     * @tc.desc      new SceneModuleInfo("hello world", "datashare:///media/image/1", "abc", 3, 3) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0079 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('hello world', 'datashare:///media/image/1', 'abc', 3, 3);
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "datas...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0080
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0080
     * @tc.desc      new SceneModuleInfo("Sample Title 123", "not a url", "123", 0, -1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0080 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Sample Title 123', 'not a url', '123', 0, -1);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('not a url');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0081
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0081
     * @tc.desc      new SceneModuleInfo("Hello", "http://example.com/a.mp3", "abc", -1, 3) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0081 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'http://example.com/a.mp3', 'abc', -1, 3);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0082
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0082
     * @tc.desc      new SceneModuleInfo("Hello", "not a url", "a", 100, 3) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0082 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'not a url', 'a', 100, 3);
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('not a url');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('a');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0083
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0083
     * @tc.desc      new SceneModuleInfo("Hello", "datashare:///media/image/1", "123", 2, 100) initialises 8 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0083 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'datashare:///media/image/1', '123', 2, 100);
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0084
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0084
     * @tc.desc      new SceneModuleInfo(" ", "https://example.com/media/video.mp4", "", -1, 100) initialises 8 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0084 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'https://example.com/media/video.mp4', '', -1, 100);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0085
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0085
     * @tc.desc      new SceneModuleInfo("Sample Title 123", "datashare:///media/image/1", "", 1, 5) initialises 8 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0085 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Sample Title 123', 'datashare:///media/image/1', '', 1, 5);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0086
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0086
     * @tc.desc      new SceneModuleInfo(" ", "http://example.com/a.mp3", "abc", 2, 1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0086 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'http://example.com/a.mp3', 'abc', 2, 1);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0087
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0087
     * @tc.desc      new SceneModuleInfo("Hello", "a", "", 2, -1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0087 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'a', '', 2, -1);
      logInfo(`new SceneModuleInfo("Hello", "a", "", 2, -1): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "a", "", 2, -1): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("Hello", "a", "", 2, -1): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", "", 2, -1): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Hello", "a", "", 2, -1): subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", "", 2, -1): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("Hello", "a", "", 2, -1): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", "", 2, -1): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0088
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0088
     * @tc.desc      new SceneModuleInfo("Sample Title 123", "datashare:///media/image/1", "Hello World", 100, -1) in...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0088 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Sample Title 123', 'datashare:///media/image/1',
        'Hello World', 100, -1);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('Hello World');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0089
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0089
     * @tc.desc      new SceneModuleInfo("??", "a", "abc", 0, 3) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0089 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('\u4e2d\u6587', 'a', 'abc', 0, 3);
      logInfo(`new SceneModuleInfo("??", "a", "abc", 0, 3): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587');
      logInfo(`new SceneModuleInfo("??", "a", "abc", 0, 3): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("??", "a", "abc", 0, 3): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "a", "abc", 0, 3): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("??", "a", "abc", 0, 3): subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo("??", "a", "abc", 0, 3): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("??", "a", "abc", 0, 3): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "a", "abc", 0, 3): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0090
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0090
     * @tc.desc      new SceneModuleInfo("Hello", "http://example.com/a.mp3", " ", 3, 5) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0090 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'http://example.com/a.mp3', ' ', 3, 5);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' ');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0091
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0091
     * @tc.desc      new SceneModuleInfo("Hello", "http://example.com/a.mp3", " a ", -1, 10) initialises 8 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0091 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'http://example.com/a.mp3', ' a ', -1, 10);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0092
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0092
     * @tc.desc      new SceneModuleInfo("Sample Title 123", "http://example.com/a.mp3", "Hello World", 100, -1) init...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0092 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Sample Title 123', 'http://example.com/a.mp3',
        'Hello World', 100, -1);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('Hello World');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0093
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0093
     * @tc.desc      new SceneModuleInfo("Sample Title 123", "a", "123", 0, 1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0093 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Sample Title 123', 'a', '123', 0, 1);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0094
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0094
     * @tc.desc      new SceneModuleInfo(" ", "http://example.com/a.mp3", "", 10, 0) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0094 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'http://example.com/a.mp3', '', 10, 0);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0095
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0095
     * @tc.desc      new SceneModuleInfo("Sample Title 123", "file://media/Photo/1/IMG_1.jpg", "", 5, 3) initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0095 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Sample Title 123', 'file://media/Photo/1/IMG_1.jpg', '', 5,
        3);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0096
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0096
     * @tc.desc      new SceneModuleInfo("", "http://example.com/a.mp3", "Hello World", 2, 0) initialises 8 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0096 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('', 'http://example.com/a.mp3', 'Hello World', 2, 0);
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('Hello World');
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("", "http://example.c...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0096 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0097
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0097
     * @tc.desc      new SceneModuleInfo("Sample Title 123", "datashare:///media/image/1", "123", 0, 5) initialises 8...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0097 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Sample Title 123', 'datashare:///media/image/1', '123', 0,
        5);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0098
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0098
     * @tc.desc      new SceneModuleInfo(" ", "not a url", "", 5, 5) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0098 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'not a url', '', 5, 5);
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('not a url');
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0099
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0099
     * @tc.desc      new SceneModuleInfo("Hello", "", "", -1, 10) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0099 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', '', '', -1, 10);
      logInfo(`new SceneModuleInfo("Hello", "", "", -1, 10): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "", "", -1, 10): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", "", -1, 10): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", "", -1, 10): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("Hello", "", "", -1, 10): subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", "", -1, 10): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Hello", "", "", -1, 10): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", "", -1, 10): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0100
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0100
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "123", 100, 10) initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0100 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '123', 100,
        10);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0101
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0101
     * @tc.desc      new SceneModuleInfo("hello world", "file://media/Photo/1/IMG_1.jpg", "", 5, 100) initialises 8 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0101 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('hello world', 'file://media/Photo/1/IMG_1.jpg', '', 5, 100);
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0102
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0102
     * @tc.desc      new SceneModuleInfo(" ", "http://example.com/a.mp3", "Hello World", -1, 1) initialises 8 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0102 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'http://example.com/a.mp3', 'Hello World', -1, 1);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('Hello World');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "http://example....: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0102 end`);
    });
  });
}
