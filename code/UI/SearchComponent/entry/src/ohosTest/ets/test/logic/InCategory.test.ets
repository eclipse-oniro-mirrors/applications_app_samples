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
import { inCategory } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for inCategory (50 cases). */
export default function inCategoryTest(): void {
  describe('InCategoryTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0001
     * @tc.name      SearchComponent_InCategory_0001
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_InCategory_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}InCategory_0001 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        '');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}InCategory_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0002
     * @tc.name      SearchComponent_InCategory_0002
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_InCategory_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}InCategory_0002 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'a');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0003
     * @tc.name      SearchComponent_InCategory_0003
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0003 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'abc');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0004
     * @tc.name      SearchComponent_InCategory_0004
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0004 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'Hello World');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0005
     * @tc.name      SearchComponent_InCategory_0005
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0005 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        ' ');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0006
     * @tc.name      SearchComponent_InCategory_0006
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0006 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        '123');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0007
     * @tc.name      SearchComponent_InCategory_0007
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0007 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        ' a ');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0008
     * @tc.name      SearchComponent_InCategory_0008
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0008 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'aa');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0009
     * @tc.name      SearchComponent_InCategory_0009
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0009 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'a_1');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0010
     * @tc.name      SearchComponent_InCategory_0010
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0010 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'xa');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0011
     * @tc.name      SearchComponent_InCategory_0011
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0011 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        ' abc ');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0012
     * @tc.name      SearchComponent_InCategory_0012
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0012 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'abcabc');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0013
     * @tc.name      SearchComponent_InCategory_0013
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0013 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'abc_1');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0014
     * @tc.name      SearchComponent_InCategory_0014
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0014 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'xabc');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0015
     * @tc.name      SearchComponent_InCategory_0015
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0015 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        ' Hello World ');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0016
     * @tc.name      SearchComponent_InCategory_0016
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0016 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'Hello WorldHello World');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0017
     * @tc.name      SearchComponent_InCategory_0017
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0017 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'Hello World_1');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0018
     * @tc.name      SearchComponent_InCategory_0018
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0018 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'xHello World');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0019
     * @tc.name      SearchComponent_InCategory_0019
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0019 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        '   ');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0020
     * @tc.name      SearchComponent_InCategory_0020
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0020 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        '  ');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0021
     * @tc.name      SearchComponent_InCategory_0021
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0021 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        ' _1');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0022
     * @tc.name      SearchComponent_InCategory_0022
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0022 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        'x ');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0023
     * @tc.name      SearchComponent_InCategory_0023
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0023 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        ' 123 ');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0024
     * @tc.name      SearchComponent_InCategory_0024
     * @tc.desc      inCategory(item=SceneModuleInfo("Hello", "https://example.com/media/video.mp4", "", 0, 0), categ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0024 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('Hello', 'https://example.com/media/video.mp4', '', 0, 0),
        '123123');
      logInfo(`inCategory(item=SceneModuleInfo("Hello", ...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0025
     * @tc.name      SearchComponent_InCategory_0025
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0025 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), '');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}InCategory_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0026
     * @tc.name      SearchComponent_InCategory_0026
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0026 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'a');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0027
     * @tc.name      SearchComponent_InCategory_0027
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0027 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'abc');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0028
     * @tc.name      SearchComponent_InCategory_0028
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0028 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'Hello World');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0029
     * @tc.name      SearchComponent_InCategory_0029
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0029 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), ' ');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0030
     * @tc.name      SearchComponent_InCategory_0030
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0030 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), '123');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0031
     * @tc.name      SearchComponent_InCategory_0031
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0031 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), ' a ');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0032
     * @tc.name      SearchComponent_InCategory_0032
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0032 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'aa');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0033
     * @tc.name      SearchComponent_InCategory_0033
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0033 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'a_1');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0034
     * @tc.name      SearchComponent_InCategory_0034
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0034 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'xa');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0035
     * @tc.name      SearchComponent_InCategory_0035
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0035 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), ' abc ');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0036
     * @tc.name      SearchComponent_InCategory_0036
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0036 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'abcabc');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0037
     * @tc.name      SearchComponent_InCategory_0037
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0037 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'abc_1');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0038
     * @tc.name      SearchComponent_InCategory_0038
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0038 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'xabc');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0039
     * @tc.name      SearchComponent_InCategory_0039
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0039 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), ' Hello World ');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0040
     * @tc.name      SearchComponent_InCategory_0040
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0040 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'Hello WorldHello World');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0041
     * @tc.name      SearchComponent_InCategory_0041
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0041 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'Hello World_1');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0042
     * @tc.name      SearchComponent_InCategory_0042
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0042 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'xHello World');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0043
     * @tc.name      SearchComponent_InCategory_0043
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0043 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), '   ');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0044
     * @tc.name      SearchComponent_InCategory_0044
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0044 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), '  ');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0045
     * @tc.name      SearchComponent_InCategory_0045
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0045 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), ' _1');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0046
     * @tc.name      SearchComponent_InCategory_0046
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0046 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), 'x ');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0047
     * @tc.name      SearchComponent_InCategory_0047
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0047 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), ' 123 ');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0048
     * @tc.name      SearchComponent_InCategory_0048
     * @tc.desc      inCategory(item=SceneModuleInfo("hello world", "https://example.com/media/video.mp4", "", 0, 0),...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0048 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('hello world', 'https://example.com/media/video.mp4', '',
        0, 0), '123123');
      logInfo(`inCategory(item=SceneModuleInfo("hello wo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0049
     * @tc.name      SearchComponent_InCategory_0049
     * @tc.desc      inCategory(item=SceneModuleInfo("", "https://example.com/media/video.mp4", "", 0, 0), category="...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_InCategory_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InCategory_0049 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('', 'https://example.com/media/video.mp4', '', 0, 0), '');
      logInfo(`inCategory(item=SceneModuleInfo("", "http...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}InCategory_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_IN_CATEGORY_0050
     * @tc.name      SearchComponent_InCategory_0050
     * @tc.desc      inCategory(item=SceneModuleInfo("", "https://example.com/media/video.mp4", "", 0, 0), category="...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_InCategory_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InCategory_0050 begin`);
      const actual: boolean = inCategory(new SceneModuleInfo('', 'https://example.com/media/video.mp4', '', 0, 0), 'a');
      logInfo(`inCategory(item=SceneModuleInfo("", "http...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InCategory_0050 end`);
    });
  });
}
