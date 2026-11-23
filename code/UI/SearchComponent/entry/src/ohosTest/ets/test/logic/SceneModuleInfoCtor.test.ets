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
export default function sceneModuleInfoCtorTest(): void {
  describe('SceneModuleInfoCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0001
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0001
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SceneModuleInfoCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0001 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0002
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0002
     * @tc.desc      new SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0) initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SceneModuleInfoCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0002 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '', 0,
        0);
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0003
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0003
     * @tc.desc      new SceneModuleInfo("", "https://example.com/media/video.mp4", "", 0, 0) initialises 8 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0003 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('', 'https://example.com/media/video.mp4', '', 0, 0);
      logInfo(`new SceneModuleInfo("", "https://example....: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new SceneModuleInfo("", "https://example....: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("", "https://example....: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("", "https://example....: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("", "https://example....: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("", "https://example....: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("", "https://example....: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("", "https://example....: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0004
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0004
     * @tc.desc      new SceneModuleInfo(" ", "https://example.com/media/video.mp4", "", 0, 0) initialises 8 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0004 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'https://example.com/media/video.mp4', '', 0, 0);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0005
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0005
     * @tc.desc      new SceneModuleInfo("A", "https://example.com/media/video.mp4", "", 0, 0) initialises 8 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0005 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('A', 'https://example.com/media/video.mp4', '', 0, 0);
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A');
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("A", "https://example...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0006
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0006
     * @tc.desc      new SceneModuleInfo("Sample Title 123", "https://example.com/media/video.mp4", "", 0, 0) initial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0006 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Sample Title 123', 'https://example.com/media/video.mp4',
        '', 0, 0);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0007
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0007
     * @tc.desc      new SceneModuleInfo("??", "https://example.com/media/video.mp4", "", 0, 0) initialises 8 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0007 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('\u4e2d\u6587', 'https://example.com/media/video.mp4', '', 0,
        0);
      logInfo(`new SceneModuleInfo("??", "https://exampl...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587');
      logInfo(`new SceneModuleInfo("??", "https://exampl...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("??", "https://exampl...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "https://exampl...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("??", "https://exampl...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "https://exampl...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("??", "https://exampl...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "https://exampl...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0008
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0008
     * @tc.desc      new SceneModuleInfo("Hello", "http://example.com/a.mp3", "", 0, 0) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0008 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'http://example.com/a.mp3', '', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0009
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0009
     * @tc.desc      new SceneModuleInfo("Hello", "file://media/Photo/1/IMG_1.jpg", "", 0, 0) initialises 8 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0009 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'file://media/Photo/1/IMG_1.jpg', '', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "file://medi...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "file://medi...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new SceneModuleInfo("Hello", "file://medi...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "file://medi...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "file://medi...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "file://medi...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "file://medi...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "file://medi...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0010
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0010
     * @tc.desc      new SceneModuleInfo("Hello", "datashare:///media/image/1", "", 0, 0) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0010 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'datashare:///media/image/1', '', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0011
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0011
     * @tc.desc      new SceneModuleInfo("Hello", "", "", 0, 0) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0011 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', '', '', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "", "", 0, 0): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "", "", 0, 0): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", "", 0, 0): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", "", 0, 0): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "", "", 0, 0): subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", "", 0, 0): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "", "", 0, 0): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", "", 0, 0): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0012
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0012
     * @tc.desc      new SceneModuleInfo("Hello", "not a url", "", 0, 0) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0012 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'not a url', '', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('not a url');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "not a url",...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0013
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0013
     * @tc.desc      new SceneModuleInfo("Hello", "a", "", 0, 0) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0013 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'a', '', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "a", "", 0, 0): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "a", "", 0, 0): subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("Hello", "a", "", 0, 0): subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", "", 0, 0): subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "a", "", 0, 0): subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", "", 0, 0): subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "a", "", 0, 0): subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "a", "", 0, 0): subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0014
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0014
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "a", 0, 0) initialises 8 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0014 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', 'a', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('a');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0015
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0015
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "abc", 0, 0) initialises 8 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0015 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', 'abc', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0016
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0016
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "Hello World", 0, 0) initial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0016 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4',
        'Hello World', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('Hello World');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0017
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0017
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", " ", 0, 0) initialises 8 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0017 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', ' ', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' ');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0018
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0018
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "123", 0, 0) initialises 8 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0018 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '123', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0019
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0019
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", " a ", 0, 0) initialises 8 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0019 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', ' a ', 0, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0020
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0020
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 1, 0) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0020 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 1, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0021
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0021
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 2, 0) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0021 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 2, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0022
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0022
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 5, 0) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0022 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 5, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0023
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0023
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 10, 0) initialises 8 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0023 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 10, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0024
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0024
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 100, 0) initialises 8 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0024 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 100, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0025
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0025
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", -1, 0) initialises 8 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0025 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', -1, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0026
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0026
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 3, 0) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0026 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 3, 0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0027
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0027
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 1) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0027 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 1);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0028
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0028
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 2) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0028 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 2);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0029
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0029
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 5) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0029 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 5);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0030
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0030
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 10) initialises 8 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0030 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 10);
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
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0031
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0031
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 100) initialises 8 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0031 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 100);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0032
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0032
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, -1) initialises 8 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0032 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, -1);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0033
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0033
     * @tc.desc      new SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 3) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0033 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 3);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "https://exa...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0034
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0034
     * @tc.desc      new SceneModuleInfo("Hello", "datashare:///media/image/1", " a ", 1, 5) initialises 8 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0034 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'datashare:///media/image/1', ' a ', 1, 5);
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "datashare:/...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0035
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0035
     * @tc.desc      new SceneModuleInfo(" ", "not a url", " a ", 1, 1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0035 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'not a url', ' a ', 1, 1);
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('not a url');
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", " a...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0036
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0036
     * @tc.desc      new SceneModuleInfo(" ", "https://example.com/media/video.mp4", "abc", 5, 2) initialises 8 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0036 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'https://example.com/media/video.mp4', 'abc', 5, 2);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "https://example...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0037
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0037
     * @tc.desc      new SceneModuleInfo("hello world", "http://example.com/a.mp3", "abc", 100, 3) initialises 8 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0037 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('hello world', 'http://example.com/a.mp3', 'abc', 100, 3);
      logInfo(`new SceneModuleInfo("hello world", "http:...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new SceneModuleInfo("hello world", "http:...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("hello world", "http:...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "http:...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("hello world", "http:...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo("hello world", "http:...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("hello world", "http:...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "http:...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0038
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0038
     * @tc.desc      new SceneModuleInfo("Hello", "http://example.com/a.mp3", "a", 2, -1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0038 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'http://example.com/a.mp3', 'a', 2, -1);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('a');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0039
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0039
     * @tc.desc      new SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "abc", 0, 1) initialis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0039 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', 'abc',
        0, 1);
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0040
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0040
     * @tc.desc      new SceneModuleInfo(" ", "datashare:///media/image/1", "123", 2, 100) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0040 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'datashare:///media/image/1', '123', 2, 100);
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "datashare:///me...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0041
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0041
     * @tc.desc      new SceneModuleInfo("Sample Title 123", "file://media/Photo/1/IMG_1.jpg", "", 5, -1) initialises...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0041 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Sample Title 123', 'file://media/Photo/1/IMG_1.jpg', '', 5,
        -1);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Sample Title 123", "...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0042
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0042
     * @tc.desc      new SceneModuleInfo("??", "datashare:///media/image/1", "a", 0, 100) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0042 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('\u4e2d\u6587', 'datashare:///media/image/1', 'a', 0, 100);
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587');
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('datashare:///media/image/1');
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('a');
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "datashare:///m...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0043
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0043
     * @tc.desc      new SceneModuleInfo("Hello", "", "123", 2, 2) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0043 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', '', '123', 2, 2);
      logInfo(`new SceneModuleInfo("Hello", "", "123", 2...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "", "123", 2...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", "123", 2...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", "123", 2...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("Hello", "", "123", 2...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("Hello", "", "123", 2...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("Hello", "", "123", 2...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", "123", 2...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0044
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0044
     * @tc.desc      new SceneModuleInfo("Hello", "http://example.com/a.mp3", "123", 10, 10) initialises 8 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0044 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'http://example.com/a.mp3', '123', 10, 10);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('123');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0045
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0045
     * @tc.desc      new SceneModuleInfo("hello world", "file://media/Photo/1/IMG_1.jpg", "Hello World", -1, 5) initi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0045 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('hello world', 'file://media/Photo/1/IMG_1.jpg',
        'Hello World', -1, 5);
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('Hello World');
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "file:...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0046
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0046
     * @tc.desc      new SceneModuleInfo("Hello", "", " a ", -1, 0) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0046 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', '', ' a ', -1, 0);
      logInfo(`new SceneModuleInfo("Hello", "", " a ", -...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "", " a ", -...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", " a ", -...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", " a ", -...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(0);
      logInfo(`new SceneModuleInfo("Hello", "", " a ", -...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("Hello", "", " a ", -...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(-1);
      logInfo(`new SceneModuleInfo("Hello", "", " a ", -...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "", " a ", -...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0047
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0047
     * @tc.desc      new SceneModuleInfo("", "file://media/Photo/1/IMG_1.jpg", " ", 1, 3) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0047 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('', 'file://media/Photo/1/IMG_1.jpg', ' ', 1, 3);
      logInfo(`new SceneModuleInfo("", "file://media/Pho...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new SceneModuleInfo("", "file://media/Pho...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`new SceneModuleInfo("", "file://media/Pho...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("", "file://media/Pho...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("", "file://media/Pho...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' ');
      logInfo(`new SceneModuleInfo("", "file://media/Pho...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo("", "file://media/Pho...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("", "file://media/Pho...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0048
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0048
     * @tc.desc      new SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "abc", 3, 5) initialis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0048 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', 'abc',
        3, 5);
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('abc');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("hello world", "https...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0049
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0049
     * @tc.desc      new SceneModuleInfo("??", "a", "Hello World", 5, 2) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0049 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('\u4e2d\u6587', 'a', 'Hello World', 5, 2);
      logInfo(`new SceneModuleInfo("??", "a", "Hello Wor...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587');
      logInfo(`new SceneModuleInfo("??", "a", "Hello Wor...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('a');
      logInfo(`new SceneModuleInfo("??", "a", "Hello Wor...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "a", "Hello Wor...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(2);
      logInfo(`new SceneModuleInfo("??", "a", "Hello Wor...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('Hello World');
      logInfo(`new SceneModuleInfo("??", "a", "Hello Wor...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(5);
      logInfo(`new SceneModuleInfo("??", "a", "Hello Wor...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("??", "a", "Hello Wor...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0050
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0050
     * @tc.desc      new SceneModuleInfo("Hello", "http://example.com/a.mp3", " a ", 10, 100) initialises 8 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0050 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo('Hello', 'http://example.com/a.mp3', ' a ', 10, 100);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('http://example.com/a.mp3');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(100);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual(' a ');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(10);
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo("Hello", "http://exam...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SCENE_MODULE_INFO_CTOR_0051
     * @tc.name      SearchComponent_SceneModuleInfoCtor_0051
     * @tc.desc      new SceneModuleInfo(" ", "not a url", "", 3, 1) initialises 8 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SceneModuleInfoCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0051 begin`);
      const subject: SceneModuleInfo = new SceneModuleInfo(' ', 'not a url', '', 3, 1);
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.appUri=${subject.appUri}`);
      expect(subject.appUri).assertEqual('not a url');
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.param=${subject.param}`);
      expect(subject.param).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.ratingNumber=${subject.ratingNumber}`);
      expect(subject.ratingNumber).assertEqual(1);
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.category=${subject.category}`);
      expect(subject.category).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.serialNumber=${subject.serialNumber}`);
      expect(subject.serialNumber).assertEqual(3);
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.swiperImage=${subject.swiperImage}`);
      expect(subject.swiperImage).assertEqual('');
      logInfo(`new SceneModuleInfo(" ", "not a url", "",...: subject.helperUrl=${subject.helperUrl}`);
      expect(subject.helperUrl).assertEqual('');
      logInfo(`${BUNDLE}SceneModuleInfoCtor_0051 end`);
    });
  });
}
