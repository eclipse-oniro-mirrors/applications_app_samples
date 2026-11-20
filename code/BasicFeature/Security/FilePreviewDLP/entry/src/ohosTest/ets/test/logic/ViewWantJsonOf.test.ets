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
import { yieldToEventLoop } from '../../utils/EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { viewWantJsonOf } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for viewWantJsonOf (90 cases). */
export default function viewWantJsonOfTest(): void {
  describe('ViewWantJsonOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0001
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0001
     * @tc.desc      viewWantJsonOf(uri="https://example.com/media/video.mp4") returns "://example.com/media/video.mp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_ViewWantJsonOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0001 begin`);
      const actual: string = viewWantJsonOf('https://example.com/media/video.mp4');
      logInfo(`viewWantJsonOf(uri="https://example.com/m...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`viewWantJsonOf(uri="https://example.com/m...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="https://example.com/m...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('://example.com/media/video.mp4"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0002
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0002
     * @tc.desc      viewWantJsonOf(uri="http://example.com/a.mp3") returns "uri?":?"http://example.com/a.mp3?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_ViewWantJsonOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0002 begin`);
      const actual: string = viewWantJsonOf('http://example.com/a.mp3');
      logInfo(`viewWantJsonOf(uri="http://example.com/a....: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`viewWantJsonOf(uri="http://example.com/a....: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="http://example.com/a....: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual('uri":"http://example.com/a.mp3"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0003
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0003
     * @tc.desc      viewWantJsonOf(uri="file://media/Photo/1/IMG_1.jpg") returns "file://media/Photo/1/IMG_1.jpg?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0003 begin`);
      const actual: string = viewWantJsonOf('file://media/Photo/1/IMG_1.jpg');
      logInfo(`viewWantJsonOf(uri="file://media/Photo/1/...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`viewWantJsonOf(uri="file://media/Photo/1/...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="file://media/Photo/1/...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('file://media/Photo/1/IMG_1.jpg"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0004
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0004
     * @tc.desc      viewWantJsonOf(uri="datashare:///media/image/1") returns "i?":?"datashare:///media/image/1?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0004 begin`);
      const actual: string = viewWantJsonOf('datashare:///media/image/1');
      logInfo(`viewWantJsonOf(uri="datashare:///media/im...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`viewWantJsonOf(uri="datashare:///media/im...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="datashare:///media/im...: actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('i":"datashare:///media/image/1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0005
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0005
     * @tc.desc      viewWantJsonOf(uri="") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0005 begin`);
      const actual: string = viewWantJsonOf('');
      logInfo(`viewWantJsonOf(uri=""): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":""}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0006
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0006
     * @tc.desc      viewWantJsonOf(uri="not a url") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"not...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0006 begin`);
      const actual: string = viewWantJsonOf('not a url');
      logInfo(`viewWantJsonOf(uri="not a url"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"not a url"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0007
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0007
     * @tc.desc      viewWantJsonOf(uri="a") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"a?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0007 begin`);
      const actual: string = viewWantJsonOf('a');
      logInfo(`viewWantJsonOf(uri="a"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"a"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0008
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0008
     * @tc.desc      viewWantJsonOf(uri="abc") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"abc?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0008 begin`);
      const actual: string = viewWantJsonOf('abc');
      logInfo(`viewWantJsonOf(uri="abc"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"abc"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0009
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0009
     * @tc.desc      viewWantJsonOf(uri="Hello World") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"H...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0009 begin`);
      const actual: string = viewWantJsonOf('Hello World');
      logInfo(`viewWantJsonOf(uri="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"Hello World"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0010
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0010
     * @tc.desc      viewWantJsonOf(uri=" ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?" ?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0010 begin`);
      const actual: string = viewWantJsonOf(' ');
      logInfo(`viewWantJsonOf(uri=" "): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":" "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0011
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0011
     * @tc.desc      viewWantJsonOf(uri="123") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"123?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0011 begin`);
      const actual: string = viewWantJsonOf('123');
      logInfo(`viewWantJsonOf(uri="123"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"123"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0012
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0012
     * @tc.desc      viewWantJsonOf(uri=" https://example.com/media/video.mp4 ") returns "//example.com/media/video.m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0012 begin`);
      const actual: string = viewWantJsonOf(' https://example.com/media/video.mp4 ');
      logInfo(`viewWantJsonOf(uri=" https://example.com/...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`viewWantJsonOf(uri=" https://example.com/...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri=" https://example.com/...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual('//example.com/media/video.mp4 "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0013
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0013
     * @tc.desc      viewWantJsonOf(uri="https://example.com/media/video.mp4_1") returns "/example.com/media/video.mp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0013 begin`);
      const actual: string = viewWantJsonOf('https://example.com/media/video.mp4_1');
      logInfo(`viewWantJsonOf(uri="https://example.com/m...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`viewWantJsonOf(uri="https://example.com/m...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="https://example.com/m...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual('/example.com/media/video.mp4_1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0014
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0014
     * @tc.desc      viewWantJsonOf(uri="xhttps://example.com/media/video.mp4") returns "://example.com/media/video.m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0014 begin`);
      const actual: string = viewWantJsonOf('xhttps://example.com/media/video.mp4');
      logInfo(`viewWantJsonOf(uri="xhttps://example.com/...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`viewWantJsonOf(uri="xhttps://example.com/...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="xhttps://example.com/...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('://example.com/media/video.mp4"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0015
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0015
     * @tc.desc      viewWantJsonOf(uri=" http://example.com/a.mp3 ") returns "i?":?" http://example.com/a.mp3 ?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0015 begin`);
      const actual: string = viewWantJsonOf(' http://example.com/a.mp3 ');
      logInfo(`viewWantJsonOf(uri=" http://example.com/a...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`viewWantJsonOf(uri=" http://example.com/a...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri=" http://example.com/a...: actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('i":" http://example.com/a.mp3 "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0016
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0016
     * @tc.desc      viewWantJsonOf(uri="http://example.com/a.mp3_1") returns "i?":?"http://example.com/a.mp3_1?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0016 begin`);
      const actual: string = viewWantJsonOf('http://example.com/a.mp3_1');
      logInfo(`viewWantJsonOf(uri="http://example.com/a....: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`viewWantJsonOf(uri="http://example.com/a....: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="http://example.com/a....: actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('i":"http://example.com/a.mp3_1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0017
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0017
     * @tc.desc      viewWantJsonOf(uri="xhttp://example.com/a.mp3") returns "ri?":?"xhttp://example.com/a.mp3?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0017 begin`);
      const actual: string = viewWantJsonOf('xhttp://example.com/a.mp3');
      logInfo(`viewWantJsonOf(uri="xhttp://example.com/a...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`viewWantJsonOf(uri="xhttp://example.com/a...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="xhttp://example.com/a...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('ri":"xhttp://example.com/a.mp3"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0018
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0018
     * @tc.desc      viewWantJsonOf(uri=" file://media/Photo/1/IMG_1.jpg ") returns "ile://media/Photo/1/IMG_1.jpg ?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0018 begin`);
      const actual: string = viewWantJsonOf(' file://media/Photo/1/IMG_1.jpg ');
      logInfo(`viewWantJsonOf(uri=" file://media/Photo/1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`viewWantJsonOf(uri=" file://media/Photo/1...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri=" file://media/Photo/1...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('ile://media/Photo/1/IMG_1.jpg "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0019
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0019
     * @tc.desc      viewWantJsonOf(uri="file://media/Photo/1/IMG_1.jpg_1") returns "le://media/Photo/1/IMG_1.jpg_1?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0019 begin`);
      const actual: string = viewWantJsonOf('file://media/Photo/1/IMG_1.jpg_1');
      logInfo(`viewWantJsonOf(uri="file://media/Photo/1/...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`viewWantJsonOf(uri="file://media/Photo/1/...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="file://media/Photo/1/...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('le://media/Photo/1/IMG_1.jpg_1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0020
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0020
     * @tc.desc      viewWantJsonOf(uri="xfile://media/Photo/1/IMG_1.jpg") returns "file://media/Photo/1/IMG_1.jpg?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0020 begin`);
      const actual: string = viewWantJsonOf('xfile://media/Photo/1/IMG_1.jpg');
      logInfo(`viewWantJsonOf(uri="xfile://media/Photo/1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`viewWantJsonOf(uri="xfile://media/Photo/1...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="xfile://media/Photo/1...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('file://media/Photo/1/IMG_1.jpg"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0021
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0021
     * @tc.desc      viewWantJsonOf(uri=" datashare:///media/image/1 ") returns ":?" datashare:///media/image/1 ?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0021 begin`);
      const actual: string = viewWantJsonOf(' datashare:///media/image/1 ');
      logInfo(`viewWantJsonOf(uri=" datashare:///media/i...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`viewWantJsonOf(uri=" datashare:///media/i...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri=" datashare:///media/i...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual(':" datashare:///media/image/1 "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0022
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0022
     * @tc.desc      viewWantJsonOf(uri="datashare:///media/image/1_1") returns ":?"datashare:///media/image/1_1?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0022 begin`);
      const actual: string = viewWantJsonOf('datashare:///media/image/1_1');
      logInfo(`viewWantJsonOf(uri="datashare:///media/im...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`viewWantJsonOf(uri="datashare:///media/im...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="datashare:///media/im...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual(':"datashare:///media/image/1_1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0023
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0023
     * @tc.desc      viewWantJsonOf(uri="xdatashare:///media/image/1") returns "?":?"xdatashare:///media/image/1?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0023 begin`);
      const actual: string = viewWantJsonOf('xdatashare:///media/image/1');
      logInfo(`viewWantJsonOf(uri="xdatashare:///media/i...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`viewWantJsonOf(uri="xdatashare:///media/i...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="xdatashare:///media/i...: actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('":"xdatashare:///media/image/1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0024
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0024
     * @tc.desc      viewWantJsonOf(uri=" not a url ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?" ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0024 begin`);
      const actual: string = viewWantJsonOf(' not a url ');
      logInfo(`viewWantJsonOf(uri=" not a url "): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":" not a url "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0025
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0025
     * @tc.desc      viewWantJsonOf(uri="not a urlnot a url") returns "ata?",?"uri?":?"not a urlnot a url?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0025 begin`);
      const actual: string = viewWantJsonOf('not a urlnot a url');
      logInfo(`viewWantJsonOf(uri="not a urlnot a url"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`viewWantJsonOf(uri="not a urlnot a url"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="not a urlnot a url"): actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('ata","uri":"not a urlnot a url"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0026
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0026
     * @tc.desc      viewWantJsonOf(uri="not a url_1") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0026 begin`);
      const actual: string = viewWantJsonOf('not a url_1');
      logInfo(`viewWantJsonOf(uri="not a url_1"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"not a url_1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0027
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0027
     * @tc.desc      viewWantJsonOf(uri="xnot a url") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"xn...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0027 begin`);
      const actual: string = viewWantJsonOf('xnot a url');
      logInfo(`viewWantJsonOf(uri="xnot a url"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"xnot a url"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0028
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0028
     * @tc.desc      viewWantJsonOf(uri=" a ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?" a ?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0028 begin`);
      const actual: string = viewWantJsonOf(' a ');
      logInfo(`viewWantJsonOf(uri=" a "): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":" a "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0029
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0029
     * @tc.desc      viewWantJsonOf(uri="aa") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"aa?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0029 begin`);
      const actual: string = viewWantJsonOf('aa');
      logInfo(`viewWantJsonOf(uri="aa"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"aa"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0030
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0030
     * @tc.desc      viewWantJsonOf(uri="a_1") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"a_1?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0030 begin`);
      const actual: string = viewWantJsonOf('a_1');
      logInfo(`viewWantJsonOf(uri="a_1"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"a_1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0031
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0031
     * @tc.desc      viewWantJsonOf(uri="xa") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"xa?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0031 begin`);
      const actual: string = viewWantJsonOf('xa');
      logInfo(`viewWantJsonOf(uri="xa"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"xa"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0032
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0032
     * @tc.desc      viewWantJsonOf(uri=" abc ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?" abc ?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0032 begin`);
      const actual: string = viewWantJsonOf(' abc ');
      logInfo(`viewWantJsonOf(uri=" abc "): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":" abc "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0033
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0033
     * @tc.desc      viewWantJsonOf(uri="abcabc") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"abcabc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0033 begin`);
      const actual: string = viewWantJsonOf('abcabc');
      logInfo(`viewWantJsonOf(uri="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"abcabc"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0034
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0034
     * @tc.desc      viewWantJsonOf(uri="abc_1") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"abc_1?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0034 begin`);
      const actual: string = viewWantJsonOf('abc_1');
      logInfo(`viewWantJsonOf(uri="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"abc_1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0035
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0035
     * @tc.desc      viewWantJsonOf(uri="xabc") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"xabc?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0035 begin`);
      const actual: string = viewWantJsonOf('xabc');
      logInfo(`viewWantJsonOf(uri="xabc"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"xabc"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0036
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0036
     * @tc.desc      viewWantJsonOf(uri=" Hello World ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0036 begin`);
      const actual: string = viewWantJsonOf(' Hello World ');
      logInfo(`viewWantJsonOf(uri=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":" Hello World "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0037
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0037
     * @tc.desc      viewWantJsonOf(uri="Hello WorldHello World") returns ",?"uri?":?"Hello WorldHello World?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0037 begin`);
      const actual: string = viewWantJsonOf('Hello WorldHello World');
      logInfo(`viewWantJsonOf(uri="Hello WorldHello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`viewWantJsonOf(uri="Hello WorldHello World"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"action":"ohos.want.action.view');
      logInfo(`viewWantJsonOf(uri="Hello WorldHello World"): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual(',"uri":"Hello WorldHello World"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0038
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0038
     * @tc.desc      viewWantJsonOf(uri="Hello World_1") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0038 begin`);
      const actual: string = viewWantJsonOf('Hello World_1');
      logInfo(`viewWantJsonOf(uri="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"Hello World_1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0039
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0039
     * @tc.desc      viewWantJsonOf(uri="xHello World") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0039 begin`);
      const actual: string = viewWantJsonOf('xHello World');
      logInfo(`viewWantJsonOf(uri="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"xHello World"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0040
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0040
     * @tc.desc      viewWantJsonOf(uri="   ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"   ?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0040 begin`);
      const actual: string = viewWantJsonOf('   ');
      logInfo(`viewWantJsonOf(uri="   "): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"   "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0041
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0041
     * @tc.desc      viewWantJsonOf(uri="  ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"  ?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0041 begin`);
      const actual: string = viewWantJsonOf('  ');
      logInfo(`viewWantJsonOf(uri="  "): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"  "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0042
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0042
     * @tc.desc      viewWantJsonOf(uri=" _1") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?" _1?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0042 begin`);
      const actual: string = viewWantJsonOf(' _1');
      logInfo(`viewWantJsonOf(uri=" _1"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":" _1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0043
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0043
     * @tc.desc      viewWantJsonOf(uri="x ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"x ?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0043 begin`);
      const actual: string = viewWantJsonOf('x ');
      logInfo(`viewWantJsonOf(uri="x "): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"x "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0044
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0044
     * @tc.desc      viewWantJsonOf(uri=" 123 ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?" 123 ?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0044 begin`);
      const actual: string = viewWantJsonOf(' 123 ');
      logInfo(`viewWantJsonOf(uri=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":" 123 "}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0045
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0045
     * @tc.desc      viewWantJsonOf(uri="123123") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"123123...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0045 begin`);
      const actual: string = viewWantJsonOf('123123');
      logInfo(`viewWantJsonOf(uri="123123"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"123123"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0046
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0046
     * @tc.desc      viewWantJsonOf(uri="123_1") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"123_1?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0046 begin`);
      const actual: string = viewWantJsonOf('123_1');
      logInfo(`viewWantJsonOf(uri="123_1"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"123_1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0047
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0047
     * @tc.desc      viewWantJsonOf(uri="x123") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"x123?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantJsonOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0047 begin`);
      const actual: string = viewWantJsonOf('x123');
      logInfo(`viewWantJsonOf(uri="x123"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"x123"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0048
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0048
     * @tc.desc      viewWantJsonOf(uri="4AD") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"4AD?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0048 begin`);
      const actual: string = viewWantJsonOf('4AD');
      logInfo(`viewWantJsonOf(uri="4AD"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"4AD"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0049
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0049
     * @tc.desc      viewWantJsonOf(uri="Ycp1Fi") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"Ycp1Fi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0049 begin`);
      const actual: string = viewWantJsonOf('Ycp1Fi');
      logInfo(`viewWantJsonOf(uri="Ycp1Fi"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"Ycp1Fi"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0050
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0050
     * @tc.desc      viewWantJsonOf(uri="j7xUMyaOY1") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"j7...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0050 begin`);
      const actual: string = viewWantJsonOf('j7xUMyaOY1');
      logInfo(`viewWantJsonOf(uri="j7xUMyaOY1"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"j7xUMyaOY1"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0051
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0051
     * @tc.desc      viewWantJsonOf(uri="HQGd") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"HQGd?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0051 begin`);
      const actual: string = viewWantJsonOf('HQGd');
      logInfo(`viewWantJsonOf(uri="HQGd"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"HQGd"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0052
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0052
     * @tc.desc      viewWantJsonOf(uri="n") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"n?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0052 begin`);
      const actual: string = viewWantJsonOf('n');
      logInfo(`viewWantJsonOf(uri="n"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"n"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0053
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0053
     * @tc.desc      viewWantJsonOf(uri="9eysJkUhoNtz") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0053 begin`);
      const actual: string = viewWantJsonOf('9eysJkUhoNtz');
      logInfo(`viewWantJsonOf(uri="9eysJkUhoNtz"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"9eysJkUhoNtz"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0054
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0054
     * @tc.desc      viewWantJsonOf(uri="fJ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"fJ?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0054 begin`);
      const actual: string = viewWantJsonOf('fJ');
      logInfo(`viewWantJsonOf(uri="fJ"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"fJ"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0055
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0055
     * @tc.desc      viewWantJsonOf(uri="NvUgRw8qjYs3") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0055 begin`);
      const actual: string = viewWantJsonOf('NvUgRw8qjYs3');
      logInfo(`viewWantJsonOf(uri="NvUgRw8qjYs3"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"NvUgRw8qjYs3"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0056
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0056
     * @tc.desc      viewWantJsonOf(uri="fjE") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"fjE?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0056 begin`);
      const actual: string = viewWantJsonOf('fjE');
      logInfo(`viewWantJsonOf(uri="fjE"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"fjE"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0057
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0057
     * @tc.desc      viewWantJsonOf(uri="aiX18BgZoBNJ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0057 begin`);
      const actual: string = viewWantJsonOf('aiX18BgZoBNJ');
      logInfo(`viewWantJsonOf(uri="aiX18BgZoBNJ"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"aiX18BgZoBNJ"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0058
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0058
     * @tc.desc      viewWantJsonOf(uri="1OD7u7aNrRe8") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0058 begin`);
      const actual: string = viewWantJsonOf('1OD7u7aNrRe8');
      logInfo(`viewWantJsonOf(uri="1OD7u7aNrRe8"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"1OD7u7aNrRe8"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0059
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0059
     * @tc.desc      viewWantJsonOf(uri="eaM") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"eaM?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0059 begin`);
      const actual: string = viewWantJsonOf('eaM');
      logInfo(`viewWantJsonOf(uri="eaM"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"eaM"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0060
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0060
     * @tc.desc      viewWantJsonOf(uri="UhG1KKOknR") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"Uh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0060 begin`);
      const actual: string = viewWantJsonOf('UhG1KKOknR');
      logInfo(`viewWantJsonOf(uri="UhG1KKOknR"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"UhG1KKOknR"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0061
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0061
     * @tc.desc      viewWantJsonOf(uri="um") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"um?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0061 begin`);
      const actual: string = viewWantJsonOf('um');
      logInfo(`viewWantJsonOf(uri="um"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"um"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0062
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0062
     * @tc.desc      viewWantJsonOf(uri="hw6DTEJ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"hw6DT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0062 begin`);
      const actual: string = viewWantJsonOf('hw6DTEJ');
      logInfo(`viewWantJsonOf(uri="hw6DTEJ"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"hw6DTEJ"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0063
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0063
     * @tc.desc      viewWantJsonOf(uri="cB2U") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"cB2U?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0063 begin`);
      const actual: string = viewWantJsonOf('cB2U');
      logInfo(`viewWantJsonOf(uri="cB2U"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"cB2U"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0064
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0064
     * @tc.desc      viewWantJsonOf(uri="Cwd7UWXR") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"Cwd7...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0064 begin`);
      const actual: string = viewWantJsonOf('Cwd7UWXR');
      logInfo(`viewWantJsonOf(uri="Cwd7UWXR"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"Cwd7UWXR"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0065
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0065
     * @tc.desc      viewWantJsonOf(uri="lHgZUT") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"lHgZUT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0065 begin`);
      const actual: string = viewWantJsonOf('lHgZUT');
      logInfo(`viewWantJsonOf(uri="lHgZUT"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"lHgZUT"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0066
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0066
     * @tc.desc      viewWantJsonOf(uri="54a9q8dp0MIV") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0066 begin`);
      const actual: string = viewWantJsonOf('54a9q8dp0MIV');
      logInfo(`viewWantJsonOf(uri="54a9q8dp0MIV"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"54a9q8dp0MIV"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0067
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0067
     * @tc.desc      viewWantJsonOf(uri="reJHc") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"reJHc?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0067 begin`);
      const actual: string = viewWantJsonOf('reJHc');
      logInfo(`viewWantJsonOf(uri="reJHc"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"reJHc"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0068
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0068
     * @tc.desc      viewWantJsonOf(uri="rkiLa6QY6sJb") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0068 begin`);
      const actual: string = viewWantJsonOf('rkiLa6QY6sJb');
      logInfo(`viewWantJsonOf(uri="rkiLa6QY6sJb"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"rkiLa6QY6sJb"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0069
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0069
     * @tc.desc      viewWantJsonOf(uri="L") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"L?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0069 begin`);
      const actual: string = viewWantJsonOf('L');
      logInfo(`viewWantJsonOf(uri="L"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"L"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0070
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0070
     * @tc.desc      viewWantJsonOf(uri="kVxYEH") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"kVxYEH...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0070 begin`);
      const actual: string = viewWantJsonOf('kVxYEH');
      logInfo(`viewWantJsonOf(uri="kVxYEH"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"kVxYEH"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0071
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0071
     * @tc.desc      viewWantJsonOf(uri="4vYi43Htg") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"4vY...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0071 begin`);
      const actual: string = viewWantJsonOf('4vYi43Htg');
      logInfo(`viewWantJsonOf(uri="4vYi43Htg"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"4vYi43Htg"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0072
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0072
     * @tc.desc      viewWantJsonOf(uri="57mD47toNTVL") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0072 begin`);
      const actual: string = viewWantJsonOf('57mD47toNTVL');
      logInfo(`viewWantJsonOf(uri="57mD47toNTVL"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"57mD47toNTVL"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0073
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0073
     * @tc.desc      viewWantJsonOf(uri="gXdML4") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"gXdML4...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0073 begin`);
      const actual: string = viewWantJsonOf('gXdML4');
      logInfo(`viewWantJsonOf(uri="gXdML4"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"gXdML4"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0074
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0074
     * @tc.desc      viewWantJsonOf(uri="Hmhqs") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"Hmhqs?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0074 begin`);
      const actual: string = viewWantJsonOf('Hmhqs');
      logInfo(`viewWantJsonOf(uri="Hmhqs"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"Hmhqs"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0075
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0075
     * @tc.desc      viewWantJsonOf(uri="kqVAWwKf") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"kqVA...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0075 begin`);
      const actual: string = viewWantJsonOf('kqVAWwKf');
      logInfo(`viewWantJsonOf(uri="kqVAWwKf"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"kqVAWwKf"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0076
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0076
     * @tc.desc      viewWantJsonOf(uri="eUz8nCCg") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"eUz8...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0076 begin`);
      const actual: string = viewWantJsonOf('eUz8nCCg');
      logInfo(`viewWantJsonOf(uri="eUz8nCCg"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"eUz8nCCg"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0077
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0077
     * @tc.desc      viewWantJsonOf(uri="1A2zDaQdkLfP") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0077 begin`);
      const actual: string = viewWantJsonOf('1A2zDaQdkLfP');
      logInfo(`viewWantJsonOf(uri="1A2zDaQdkLfP"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"1A2zDaQdkLfP"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0078
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0078
     * @tc.desc      viewWantJsonOf(uri="kcr") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"kcr?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0078 begin`);
      const actual: string = viewWantJsonOf('kcr');
      logInfo(`viewWantJsonOf(uri="kcr"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"kcr"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0079
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0079
     * @tc.desc      viewWantJsonOf(uri="rN27xyLrIq2") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0079 begin`);
      const actual: string = viewWantJsonOf('rN27xyLrIq2');
      logInfo(`viewWantJsonOf(uri="rN27xyLrIq2"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"rN27xyLrIq2"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0080
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0080
     * @tc.desc      viewWantJsonOf(uri="m") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"m?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0080 begin`);
      const actual: string = viewWantJsonOf('m');
      logInfo(`viewWantJsonOf(uri="m"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"m"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0081
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0081
     * @tc.desc      viewWantJsonOf(uri="RWPVhNYzZY") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"RW...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0081 begin`);
      const actual: string = viewWantJsonOf('RWPVhNYzZY');
      logInfo(`viewWantJsonOf(uri="RWPVhNYzZY"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"RWPVhNYzZY"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0082
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0082
     * @tc.desc      viewWantJsonOf(uri="lK") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"lK?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0082 begin`);
      const actual: string = viewWantJsonOf('lK');
      logInfo(`viewWantJsonOf(uri="lK"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"lK"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0083
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0083
     * @tc.desc      viewWantJsonOf(uri="vjTfXKhXWIpQ") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0083 begin`);
      const actual: string = viewWantJsonOf('vjTfXKhXWIpQ');
      logInfo(`viewWantJsonOf(uri="vjTfXKhXWIpQ"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"vjTfXKhXWIpQ"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0084
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0084
     * @tc.desc      viewWantJsonOf(uri="De") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"De?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0084 begin`);
      const actual: string = viewWantJsonOf('De');
      logInfo(`viewWantJsonOf(uri="De"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"De"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0085
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0085
     * @tc.desc      viewWantJsonOf(uri="u") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"u?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0085 begin`);
      const actual: string = viewWantJsonOf('u');
      logInfo(`viewWantJsonOf(uri="u"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"u"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0086
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0086
     * @tc.desc      viewWantJsonOf(uri="I2DzK6BD") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"I2Dz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0086 begin`);
      const actual: string = viewWantJsonOf('I2DzK6BD');
      logInfo(`viewWantJsonOf(uri="I2DzK6BD"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"I2DzK6BD"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0087
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0087
     * @tc.desc      viewWantJsonOf(uri="Pn9kRv6") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"Pn9kR...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0087 begin`);
      const actual: string = viewWantJsonOf('Pn9kRv6');
      logInfo(`viewWantJsonOf(uri="Pn9kRv6"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"Pn9kRv6"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0088
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0088
     * @tc.desc      viewWantJsonOf(uri="4QINlrXTc") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"4QI...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0088 begin`);
      const actual: string = viewWantJsonOf('4QINlrXTc');
      logInfo(`viewWantJsonOf(uri="4QINlrXTc"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"4QINlrXTc"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0089
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0089
     * @tc.desc      viewWantJsonOf(uri="aNR") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"aNR?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0089 begin`);
      const actual: string = viewWantJsonOf('aNR');
      logInfo(`viewWantJsonOf(uri="aNR"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"aNR"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_JSON_OF_0090
     * @tc.name      FilePreviewDLP_ViewWantJsonOf_0090
     * @tc.desc      viewWantJsonOf(uri="OSdJ4uc8tB") returns "{?"action?":?"ohos.want.action.viewData?",?"uri?":?"OS...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantJsonOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantJsonOf_0090 begin`);
      const actual: string = viewWantJsonOf('OSdJ4uc8tB');
      logInfo(`viewWantJsonOf(uri="OSdJ4uc8tB"): actual=${actual}`);
      expect(actual).assertEqual('{"action":"ohos.want.action.viewData","uri":"OSdJ4uc8tB"}');
      logInfo(`${BUNDLE}ViewWantJsonOf_0090 end`);
    });
  });
}
