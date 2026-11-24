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
import { ViewWant, viewWantOf } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for viewWantOf (85 cases). */
export default function viewWantOfTest(): void {
  describe('ViewWantOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0001
     * @tc.name      FilePreviewDLP_ViewWantOf_0001
     * @tc.desc      viewWantOf(uri="https://example.com/media/video.mp4") returns "https://example.com/media/video.mp4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_ViewWantOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ViewWantOf_0001 begin`);
      const actual: ViewWant = viewWantOf('https://example.com/media/video.mp4');
      logInfo(`viewWantOf(uri="https://example.com/media...: actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="https://example.com/media...: actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ViewWantOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0002
     * @tc.name      FilePreviewDLP_ViewWantOf_0002
     * @tc.desc      viewWantOf(uri="http://example.com/a.mp3") returns "http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_ViewWantOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ViewWantOf_0002 begin`);
      const actual: ViewWant = viewWantOf('http://example.com/a.mp3');
      logInfo(`viewWantOf(uri="http://example.com/a.mp3"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="http://example.com/a.mp3"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('http://example.com/a.mp3');
      logInfo(`${BUNDLE}ViewWantOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0003
     * @tc.name      FilePreviewDLP_ViewWantOf_0003
     * @tc.desc      viewWantOf(uri="file://media/Photo/1/IMG_1.jpg") returns "file://media/Photo/1/IMG_1.jpg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0003 begin`);
      const actual: ViewWant = viewWantOf('file://media/Photo/1/IMG_1.jpg');
      logInfo(`viewWantOf(uri="file://media/Photo/1/IMG_...: actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="file://media/Photo/1/IMG_...: actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ViewWantOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0004
     * @tc.name      FilePreviewDLP_ViewWantOf_0004
     * @tc.desc      viewWantOf(uri="datashare:///media/image/1") returns "datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0004 begin`);
      const actual: ViewWant = viewWantOf('datashare:///media/image/1');
      logInfo(`viewWantOf(uri="datashare:///media/image/1"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="datashare:///media/image/1"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('datashare:///media/image/1');
      logInfo(`${BUNDLE}ViewWantOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0005
     * @tc.name      FilePreviewDLP_ViewWantOf_0005
     * @tc.desc      viewWantOf(uri="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0005 begin`);
      const actual: ViewWant = viewWantOf('');
      logInfo(`viewWantOf(uri=""): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=""): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('');
      logInfo(`${BUNDLE}ViewWantOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0006
     * @tc.name      FilePreviewDLP_ViewWantOf_0006
     * @tc.desc      viewWantOf(uri="not a url") returns "not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0006 begin`);
      const actual: ViewWant = viewWantOf('not a url');
      logInfo(`viewWantOf(uri="not a url"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="not a url"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('not a url');
      logInfo(`${BUNDLE}ViewWantOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0007
     * @tc.name      FilePreviewDLP_ViewWantOf_0007
     * @tc.desc      viewWantOf(uri="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0007 begin`);
      const actual: ViewWant = viewWantOf('a');
      logInfo(`viewWantOf(uri="a"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="a"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('a');
      logInfo(`${BUNDLE}ViewWantOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0008
     * @tc.name      FilePreviewDLP_ViewWantOf_0008
     * @tc.desc      viewWantOf(uri="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0008 begin`);
      const actual: ViewWant = viewWantOf('abc');
      logInfo(`viewWantOf(uri="abc"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="abc"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('abc');
      logInfo(`${BUNDLE}ViewWantOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0009
     * @tc.name      FilePreviewDLP_ViewWantOf_0009
     * @tc.desc      viewWantOf(uri="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0009 begin`);
      const actual: ViewWant = viewWantOf('Hello World');
      logInfo(`viewWantOf(uri="Hello World"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="Hello World"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('Hello World');
      logInfo(`${BUNDLE}ViewWantOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0010
     * @tc.name      FilePreviewDLP_ViewWantOf_0010
     * @tc.desc      viewWantOf(uri=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0010 begin`);
      const actual: ViewWant = viewWantOf(' ');
      logInfo(`viewWantOf(uri=" "): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=" "): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual(' ');
      logInfo(`${BUNDLE}ViewWantOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0011
     * @tc.name      FilePreviewDLP_ViewWantOf_0011
     * @tc.desc      viewWantOf(uri="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0011 begin`);
      const actual: ViewWant = viewWantOf('123');
      logInfo(`viewWantOf(uri="123"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="123"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('123');
      logInfo(`${BUNDLE}ViewWantOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0012
     * @tc.name      FilePreviewDLP_ViewWantOf_0012
     * @tc.desc      viewWantOf(uri=" https://example.com/media/video.mp4 ") returns " https://example.com/media/vide...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0012 begin`);
      const actual: ViewWant = viewWantOf(' https://example.com/media/video.mp4 ');
      logInfo(`viewWantOf(uri=" https://example.com/medi...: actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=" https://example.com/medi...: actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual(' https://example.com/media/video.mp4 ');
      logInfo(`${BUNDLE}ViewWantOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0013
     * @tc.name      FilePreviewDLP_ViewWantOf_0013
     * @tc.desc      viewWantOf(uri="https://example.com/media/video.mp4_1") returns "https://example.com/media/video...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0013 begin`);
      const actual: ViewWant = viewWantOf('https://example.com/media/video.mp4_1');
      logInfo(`viewWantOf(uri="https://example.com/media...: actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="https://example.com/media...: actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('https://example.com/media/video.mp4_1');
      logInfo(`${BUNDLE}ViewWantOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0014
     * @tc.name      FilePreviewDLP_ViewWantOf_0014
     * @tc.desc      viewWantOf(uri="xhttps://example.com/media/video.mp4") returns "xhttps://example.com/media/video...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0014 begin`);
      const actual: ViewWant = viewWantOf('xhttps://example.com/media/video.mp4');
      logInfo(`viewWantOf(uri="xhttps://example.com/medi...: actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="xhttps://example.com/medi...: actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('xhttps://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ViewWantOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0015
     * @tc.name      FilePreviewDLP_ViewWantOf_0015
     * @tc.desc      viewWantOf(uri=" http://example.com/a.mp3 ") returns " http://example.com/a.mp3 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0015 begin`);
      const actual: ViewWant = viewWantOf(' http://example.com/a.mp3 ');
      logInfo(`viewWantOf(uri=" http://example.com/a.mp3 "): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=" http://example.com/a.mp3 "): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual(' http://example.com/a.mp3 ');
      logInfo(`${BUNDLE}ViewWantOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0016
     * @tc.name      FilePreviewDLP_ViewWantOf_0016
     * @tc.desc      viewWantOf(uri="http://example.com/a.mp3_1") returns "http://example.com/a.mp3_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0016 begin`);
      const actual: ViewWant = viewWantOf('http://example.com/a.mp3_1');
      logInfo(`viewWantOf(uri="http://example.com/a.mp3_1"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="http://example.com/a.mp3_1"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('http://example.com/a.mp3_1');
      logInfo(`${BUNDLE}ViewWantOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0017
     * @tc.name      FilePreviewDLP_ViewWantOf_0017
     * @tc.desc      viewWantOf(uri="xhttp://example.com/a.mp3") returns "xhttp://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0017 begin`);
      const actual: ViewWant = viewWantOf('xhttp://example.com/a.mp3');
      logInfo(`viewWantOf(uri="xhttp://example.com/a.mp3"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="xhttp://example.com/a.mp3"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('xhttp://example.com/a.mp3');
      logInfo(`${BUNDLE}ViewWantOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0018
     * @tc.name      FilePreviewDLP_ViewWantOf_0018
     * @tc.desc      viewWantOf(uri=" file://media/Photo/1/IMG_1.jpg ") returns " file://media/Photo/1/IMG_1.jpg "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0018 begin`);
      const actual: ViewWant = viewWantOf(' file://media/Photo/1/IMG_1.jpg ');
      logInfo(`viewWantOf(uri=" file://media/Photo/1/IMG...: actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=" file://media/Photo/1/IMG...: actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual(' file://media/Photo/1/IMG_1.jpg ');
      logInfo(`${BUNDLE}ViewWantOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0019
     * @tc.name      FilePreviewDLP_ViewWantOf_0019
     * @tc.desc      viewWantOf(uri="file://media/Photo/1/IMG_1.jpg_1") returns "file://media/Photo/1/IMG_1.jpg_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0019 begin`);
      const actual: ViewWant = viewWantOf('file://media/Photo/1/IMG_1.jpg_1');
      logInfo(`viewWantOf(uri="file://media/Photo/1/IMG_...: actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="file://media/Photo/1/IMG_...: actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('file://media/Photo/1/IMG_1.jpg_1');
      logInfo(`${BUNDLE}ViewWantOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0020
     * @tc.name      FilePreviewDLP_ViewWantOf_0020
     * @tc.desc      viewWantOf(uri="xfile://media/Photo/1/IMG_1.jpg") returns "xfile://media/Photo/1/IMG_1.jpg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0020 begin`);
      const actual: ViewWant = viewWantOf('xfile://media/Photo/1/IMG_1.jpg');
      logInfo(`viewWantOf(uri="xfile://media/Photo/1/IMG...: actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="xfile://media/Photo/1/IMG...: actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('xfile://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ViewWantOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0021
     * @tc.name      FilePreviewDLP_ViewWantOf_0021
     * @tc.desc      viewWantOf(uri=" datashare:///media/image/1 ") returns " datashare:///media/image/1 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0021 begin`);
      const actual: ViewWant = viewWantOf(' datashare:///media/image/1 ');
      logInfo(`viewWantOf(uri=" datashare:///media/image...: actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=" datashare:///media/image...: actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual(' datashare:///media/image/1 ');
      logInfo(`${BUNDLE}ViewWantOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0022
     * @tc.name      FilePreviewDLP_ViewWantOf_0022
     * @tc.desc      viewWantOf(uri="datashare:///media/image/1_1") returns "datashare:///media/image/1_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0022 begin`);
      const actual: ViewWant = viewWantOf('datashare:///media/image/1_1');
      logInfo(`viewWantOf(uri="datashare:///media/image/...: actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="datashare:///media/image/...: actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('datashare:///media/image/1_1');
      logInfo(`${BUNDLE}ViewWantOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0023
     * @tc.name      FilePreviewDLP_ViewWantOf_0023
     * @tc.desc      viewWantOf(uri="xdatashare:///media/image/1") returns "xdatashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0023 begin`);
      const actual: ViewWant = viewWantOf('xdatashare:///media/image/1');
      logInfo(`viewWantOf(uri="xdatashare:///media/image...: actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="xdatashare:///media/image...: actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('xdatashare:///media/image/1');
      logInfo(`${BUNDLE}ViewWantOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0024
     * @tc.name      FilePreviewDLP_ViewWantOf_0024
     * @tc.desc      viewWantOf(uri=" not a url ") returns " not a url "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0024 begin`);
      const actual: ViewWant = viewWantOf(' not a url ');
      logInfo(`viewWantOf(uri=" not a url "): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=" not a url "): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual(' not a url ');
      logInfo(`${BUNDLE}ViewWantOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0025
     * @tc.name      FilePreviewDLP_ViewWantOf_0025
     * @tc.desc      viewWantOf(uri="not a urlnot a url") returns "not a urlnot a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0025 begin`);
      const actual: ViewWant = viewWantOf('not a urlnot a url');
      logInfo(`viewWantOf(uri="not a urlnot a url"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="not a urlnot a url"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('not a urlnot a url');
      logInfo(`${BUNDLE}ViewWantOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0026
     * @tc.name      FilePreviewDLP_ViewWantOf_0026
     * @tc.desc      viewWantOf(uri="not a url_1") returns "not a url_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0026 begin`);
      const actual: ViewWant = viewWantOf('not a url_1');
      logInfo(`viewWantOf(uri="not a url_1"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="not a url_1"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('not a url_1');
      logInfo(`${BUNDLE}ViewWantOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0027
     * @tc.name      FilePreviewDLP_ViewWantOf_0027
     * @tc.desc      viewWantOf(uri="xnot a url") returns "xnot a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0027 begin`);
      const actual: ViewWant = viewWantOf('xnot a url');
      logInfo(`viewWantOf(uri="xnot a url"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="xnot a url"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('xnot a url');
      logInfo(`${BUNDLE}ViewWantOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0028
     * @tc.name      FilePreviewDLP_ViewWantOf_0028
     * @tc.desc      viewWantOf(uri=" a ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0028 begin`);
      const actual: ViewWant = viewWantOf(' a ');
      logInfo(`viewWantOf(uri=" a "): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=" a "): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual(' a ');
      logInfo(`${BUNDLE}ViewWantOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0029
     * @tc.name      FilePreviewDLP_ViewWantOf_0029
     * @tc.desc      viewWantOf(uri="aa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0029 begin`);
      const actual: ViewWant = viewWantOf('aa');
      logInfo(`viewWantOf(uri="aa"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="aa"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('aa');
      logInfo(`${BUNDLE}ViewWantOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0030
     * @tc.name      FilePreviewDLP_ViewWantOf_0030
     * @tc.desc      viewWantOf(uri="a_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0030 begin`);
      const actual: ViewWant = viewWantOf('a_1');
      logInfo(`viewWantOf(uri="a_1"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="a_1"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('a_1');
      logInfo(`${BUNDLE}ViewWantOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0031
     * @tc.name      FilePreviewDLP_ViewWantOf_0031
     * @tc.desc      viewWantOf(uri="xa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0031 begin`);
      const actual: ViewWant = viewWantOf('xa');
      logInfo(`viewWantOf(uri="xa"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="xa"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('xa');
      logInfo(`${BUNDLE}ViewWantOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0032
     * @tc.name      FilePreviewDLP_ViewWantOf_0032
     * @tc.desc      viewWantOf(uri=" abc ") returns " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0032 begin`);
      const actual: ViewWant = viewWantOf(' abc ');
      logInfo(`viewWantOf(uri=" abc "): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=" abc "): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual(' abc ');
      logInfo(`${BUNDLE}ViewWantOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0033
     * @tc.name      FilePreviewDLP_ViewWantOf_0033
     * @tc.desc      viewWantOf(uri="abcabc") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0033 begin`);
      const actual: ViewWant = viewWantOf('abcabc');
      logInfo(`viewWantOf(uri="abcabc"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="abcabc"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('abcabc');
      logInfo(`${BUNDLE}ViewWantOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0034
     * @tc.name      FilePreviewDLP_ViewWantOf_0034
     * @tc.desc      viewWantOf(uri="abc_1") returns "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0034 begin`);
      const actual: ViewWant = viewWantOf('abc_1');
      logInfo(`viewWantOf(uri="abc_1"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="abc_1"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('abc_1');
      logInfo(`${BUNDLE}ViewWantOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0035
     * @tc.name      FilePreviewDLP_ViewWantOf_0035
     * @tc.desc      viewWantOf(uri="xabc") returns "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0035 begin`);
      const actual: ViewWant = viewWantOf('xabc');
      logInfo(`viewWantOf(uri="xabc"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="xabc"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('xabc');
      logInfo(`${BUNDLE}ViewWantOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0036
     * @tc.name      FilePreviewDLP_ViewWantOf_0036
     * @tc.desc      viewWantOf(uri=" Hello World ") returns " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0036 begin`);
      const actual: ViewWant = viewWantOf(' Hello World ');
      logInfo(`viewWantOf(uri=" Hello World "): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=" Hello World "): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}ViewWantOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0037
     * @tc.name      FilePreviewDLP_ViewWantOf_0037
     * @tc.desc      viewWantOf(uri="Hello WorldHello World") returns "Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0037 begin`);
      const actual: ViewWant = viewWantOf('Hello WorldHello World');
      logInfo(`viewWantOf(uri="Hello WorldHello World"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="Hello WorldHello World"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}ViewWantOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0038
     * @tc.name      FilePreviewDLP_ViewWantOf_0038
     * @tc.desc      viewWantOf(uri="Hello World_1") returns "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0038 begin`);
      const actual: ViewWant = viewWantOf('Hello World_1');
      logInfo(`viewWantOf(uri="Hello World_1"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="Hello World_1"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}ViewWantOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0039
     * @tc.name      FilePreviewDLP_ViewWantOf_0039
     * @tc.desc      viewWantOf(uri="xHello World") returns "xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0039 begin`);
      const actual: ViewWant = viewWantOf('xHello World');
      logInfo(`viewWantOf(uri="xHello World"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="xHello World"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('xHello World');
      logInfo(`${BUNDLE}ViewWantOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0040
     * @tc.name      FilePreviewDLP_ViewWantOf_0040
     * @tc.desc      viewWantOf(uri="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0040 begin`);
      const actual: ViewWant = viewWantOf('   ');
      logInfo(`viewWantOf(uri="   "): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="   "): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('   ');
      logInfo(`${BUNDLE}ViewWantOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0041
     * @tc.name      FilePreviewDLP_ViewWantOf_0041
     * @tc.desc      viewWantOf(uri="  ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0041 begin`);
      const actual: ViewWant = viewWantOf('  ');
      logInfo(`viewWantOf(uri="  "): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="  "): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('  ');
      logInfo(`${BUNDLE}ViewWantOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0042
     * @tc.name      FilePreviewDLP_ViewWantOf_0042
     * @tc.desc      viewWantOf(uri=" _1") returns " _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0042 begin`);
      const actual: ViewWant = viewWantOf(' _1');
      logInfo(`viewWantOf(uri=" _1"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=" _1"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual(' _1');
      logInfo(`${BUNDLE}ViewWantOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0043
     * @tc.name      FilePreviewDLP_ViewWantOf_0043
     * @tc.desc      viewWantOf(uri="x ") returns "x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0043 begin`);
      const actual: ViewWant = viewWantOf('x ');
      logInfo(`viewWantOf(uri="x "): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="x "): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('x ');
      logInfo(`${BUNDLE}ViewWantOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0044
     * @tc.name      FilePreviewDLP_ViewWantOf_0044
     * @tc.desc      viewWantOf(uri=" 123 ") returns " 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0044 begin`);
      const actual: ViewWant = viewWantOf(' 123 ');
      logInfo(`viewWantOf(uri=" 123 "): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri=" 123 "): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual(' 123 ');
      logInfo(`${BUNDLE}ViewWantOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0045
     * @tc.name      FilePreviewDLP_ViewWantOf_0045
     * @tc.desc      viewWantOf(uri="123123") returns "123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0045 begin`);
      const actual: ViewWant = viewWantOf('123123');
      logInfo(`viewWantOf(uri="123123"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="123123"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('123123');
      logInfo(`${BUNDLE}ViewWantOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0046
     * @tc.name      FilePreviewDLP_ViewWantOf_0046
     * @tc.desc      viewWantOf(uri="123_1") returns "123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0046 begin`);
      const actual: ViewWant = viewWantOf('123_1');
      logInfo(`viewWantOf(uri="123_1"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="123_1"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('123_1');
      logInfo(`${BUNDLE}ViewWantOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0047
     * @tc.name      FilePreviewDLP_ViewWantOf_0047
     * @tc.desc      viewWantOf(uri="x123") returns "x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ViewWantOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ViewWantOf_0047 begin`);
      const actual: ViewWant = viewWantOf('x123');
      logInfo(`viewWantOf(uri="x123"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="x123"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('x123');
      logInfo(`${BUNDLE}ViewWantOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0048
     * @tc.name      FilePreviewDLP_ViewWantOf_0048
     * @tc.desc      viewWantOf(uri="MIvn") returns "MIvn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0048 begin`);
      const actual: ViewWant = viewWantOf('MIvn');
      logInfo(`viewWantOf(uri="MIvn"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="MIvn"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('MIvn');
      logInfo(`${BUNDLE}ViewWantOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0049
     * @tc.name      FilePreviewDLP_ViewWantOf_0049
     * @tc.desc      viewWantOf(uri="iP9") returns "iP9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0049 begin`);
      const actual: ViewWant = viewWantOf('iP9');
      logInfo(`viewWantOf(uri="iP9"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="iP9"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('iP9');
      logInfo(`${BUNDLE}ViewWantOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0050
     * @tc.name      FilePreviewDLP_ViewWantOf_0050
     * @tc.desc      viewWantOf(uri="XFSmWvFvhpTG") returns "XFSmWvFvhpTG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0050 begin`);
      const actual: ViewWant = viewWantOf('XFSmWvFvhpTG');
      logInfo(`viewWantOf(uri="XFSmWvFvhpTG"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="XFSmWvFvhpTG"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('XFSmWvFvhpTG');
      logInfo(`${BUNDLE}ViewWantOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0051
     * @tc.name      FilePreviewDLP_ViewWantOf_0051
     * @tc.desc      viewWantOf(uri="PTWuVN1Qr3") returns "PTWuVN1Qr3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0051 begin`);
      const actual: ViewWant = viewWantOf('PTWuVN1Qr3');
      logInfo(`viewWantOf(uri="PTWuVN1Qr3"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="PTWuVN1Qr3"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('PTWuVN1Qr3');
      logInfo(`${BUNDLE}ViewWantOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0052
     * @tc.name      FilePreviewDLP_ViewWantOf_0052
     * @tc.desc      viewWantOf(uri="KXOSL") returns "KXOSL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0052 begin`);
      const actual: ViewWant = viewWantOf('KXOSL');
      logInfo(`viewWantOf(uri="KXOSL"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="KXOSL"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('KXOSL');
      logInfo(`${BUNDLE}ViewWantOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0053
     * @tc.name      FilePreviewDLP_ViewWantOf_0053
     * @tc.desc      viewWantOf(uri="9W4hfq") returns "9W4hfq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0053 begin`);
      const actual: ViewWant = viewWantOf('9W4hfq');
      logInfo(`viewWantOf(uri="9W4hfq"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="9W4hfq"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('9W4hfq');
      logInfo(`${BUNDLE}ViewWantOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0054
     * @tc.name      FilePreviewDLP_ViewWantOf_0054
     * @tc.desc      viewWantOf(uri="qLvxxjhsWwj3") returns "qLvxxjhsWwj3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0054 begin`);
      const actual: ViewWant = viewWantOf('qLvxxjhsWwj3');
      logInfo(`viewWantOf(uri="qLvxxjhsWwj3"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="qLvxxjhsWwj3"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('qLvxxjhsWwj3');
      logInfo(`${BUNDLE}ViewWantOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0055
     * @tc.name      FilePreviewDLP_ViewWantOf_0055
     * @tc.desc      viewWantOf(uri="k6j") returns "k6j"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0055 begin`);
      const actual: ViewWant = viewWantOf('k6j');
      logInfo(`viewWantOf(uri="k6j"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="k6j"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('k6j');
      logInfo(`${BUNDLE}ViewWantOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0056
     * @tc.name      FilePreviewDLP_ViewWantOf_0056
     * @tc.desc      viewWantOf(uri="aGLwB4ff") returns "aGLwB4ff"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0056 begin`);
      const actual: ViewWant = viewWantOf('aGLwB4ff');
      logInfo(`viewWantOf(uri="aGLwB4ff"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="aGLwB4ff"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('aGLwB4ff');
      logInfo(`${BUNDLE}ViewWantOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0057
     * @tc.name      FilePreviewDLP_ViewWantOf_0057
     * @tc.desc      viewWantOf(uri="an") returns "an"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0057 begin`);
      const actual: ViewWant = viewWantOf('an');
      logInfo(`viewWantOf(uri="an"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="an"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('an');
      logInfo(`${BUNDLE}ViewWantOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0058
     * @tc.name      FilePreviewDLP_ViewWantOf_0058
     * @tc.desc      viewWantOf(uri="B8q") returns "B8q"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0058 begin`);
      const actual: ViewWant = viewWantOf('B8q');
      logInfo(`viewWantOf(uri="B8q"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="B8q"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('B8q');
      logInfo(`${BUNDLE}ViewWantOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0059
     * @tc.name      FilePreviewDLP_ViewWantOf_0059
     * @tc.desc      viewWantOf(uri="Ik2k") returns "Ik2k"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0059 begin`);
      const actual: ViewWant = viewWantOf('Ik2k');
      logInfo(`viewWantOf(uri="Ik2k"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="Ik2k"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('Ik2k');
      logInfo(`${BUNDLE}ViewWantOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0060
     * @tc.name      FilePreviewDLP_ViewWantOf_0060
     * @tc.desc      viewWantOf(uri="6") returns "6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0060 begin`);
      const actual: ViewWant = viewWantOf('6');
      logInfo(`viewWantOf(uri="6"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="6"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('6');
      logInfo(`${BUNDLE}ViewWantOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0061
     * @tc.name      FilePreviewDLP_ViewWantOf_0061
     * @tc.desc      viewWantOf(uri="ma8DXLl") returns "ma8DXLl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0061 begin`);
      const actual: ViewWant = viewWantOf('ma8DXLl');
      logInfo(`viewWantOf(uri="ma8DXLl"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="ma8DXLl"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('ma8DXLl');
      logInfo(`${BUNDLE}ViewWantOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0062
     * @tc.name      FilePreviewDLP_ViewWantOf_0062
     * @tc.desc      viewWantOf(uri="M") returns "M"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0062 begin`);
      const actual: ViewWant = viewWantOf('M');
      logInfo(`viewWantOf(uri="M"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="M"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('M');
      logInfo(`${BUNDLE}ViewWantOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0063
     * @tc.name      FilePreviewDLP_ViewWantOf_0063
     * @tc.desc      viewWantOf(uri="z2NOAaRKnu") returns "z2NOAaRKnu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0063 begin`);
      const actual: ViewWant = viewWantOf('z2NOAaRKnu');
      logInfo(`viewWantOf(uri="z2NOAaRKnu"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="z2NOAaRKnu"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('z2NOAaRKnu');
      logInfo(`${BUNDLE}ViewWantOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0064
     * @tc.name      FilePreviewDLP_ViewWantOf_0064
     * @tc.desc      viewWantOf(uri="2waO9Ib2yPhT") returns "2waO9Ib2yPhT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0064 begin`);
      const actual: ViewWant = viewWantOf('2waO9Ib2yPhT');
      logInfo(`viewWantOf(uri="2waO9Ib2yPhT"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="2waO9Ib2yPhT"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('2waO9Ib2yPhT');
      logInfo(`${BUNDLE}ViewWantOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0065
     * @tc.name      FilePreviewDLP_ViewWantOf_0065
     * @tc.desc      viewWantOf(uri="w") returns "w"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0065 begin`);
      const actual: ViewWant = viewWantOf('w');
      logInfo(`viewWantOf(uri="w"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="w"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('w');
      logInfo(`${BUNDLE}ViewWantOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0066
     * @tc.name      FilePreviewDLP_ViewWantOf_0066
     * @tc.desc      viewWantOf(uri="IpRwhNZ") returns "IpRwhNZ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0066 begin`);
      const actual: ViewWant = viewWantOf('IpRwhNZ');
      logInfo(`viewWantOf(uri="IpRwhNZ"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="IpRwhNZ"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('IpRwhNZ');
      logInfo(`${BUNDLE}ViewWantOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0067
     * @tc.name      FilePreviewDLP_ViewWantOf_0067
     * @tc.desc      viewWantOf(uri="u2SOxOuWf2") returns "u2SOxOuWf2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0067 begin`);
      const actual: ViewWant = viewWantOf('u2SOxOuWf2');
      logInfo(`viewWantOf(uri="u2SOxOuWf2"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="u2SOxOuWf2"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('u2SOxOuWf2');
      logInfo(`${BUNDLE}ViewWantOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0068
     * @tc.name      FilePreviewDLP_ViewWantOf_0068
     * @tc.desc      viewWantOf(uri="Y5k5enzMs") returns "Y5k5enzMs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0068 begin`);
      const actual: ViewWant = viewWantOf('Y5k5enzMs');
      logInfo(`viewWantOf(uri="Y5k5enzMs"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="Y5k5enzMs"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('Y5k5enzMs');
      logInfo(`${BUNDLE}ViewWantOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0069
     * @tc.name      FilePreviewDLP_ViewWantOf_0069
     * @tc.desc      viewWantOf(uri="U60jigxiEZr") returns "U60jigxiEZr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0069 begin`);
      const actual: ViewWant = viewWantOf('U60jigxiEZr');
      logInfo(`viewWantOf(uri="U60jigxiEZr"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="U60jigxiEZr"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('U60jigxiEZr');
      logInfo(`${BUNDLE}ViewWantOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0070
     * @tc.name      FilePreviewDLP_ViewWantOf_0070
     * @tc.desc      viewWantOf(uri="3sbOYW") returns "3sbOYW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0070 begin`);
      const actual: ViewWant = viewWantOf('3sbOYW');
      logInfo(`viewWantOf(uri="3sbOYW"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="3sbOYW"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('3sbOYW');
      logInfo(`${BUNDLE}ViewWantOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0071
     * @tc.name      FilePreviewDLP_ViewWantOf_0071
     * @tc.desc      viewWantOf(uri="d0D") returns "d0D"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0071 begin`);
      const actual: ViewWant = viewWantOf('d0D');
      logInfo(`viewWantOf(uri="d0D"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="d0D"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('d0D');
      logInfo(`${BUNDLE}ViewWantOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0072
     * @tc.name      FilePreviewDLP_ViewWantOf_0072
     * @tc.desc      viewWantOf(uri="5YT") returns "5YT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0072 begin`);
      const actual: ViewWant = viewWantOf('5YT');
      logInfo(`viewWantOf(uri="5YT"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="5YT"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('5YT');
      logInfo(`${BUNDLE}ViewWantOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0073
     * @tc.name      FilePreviewDLP_ViewWantOf_0073
     * @tc.desc      viewWantOf(uri="D") returns "D"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0073 begin`);
      const actual: ViewWant = viewWantOf('D');
      logInfo(`viewWantOf(uri="D"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="D"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('D');
      logInfo(`${BUNDLE}ViewWantOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0074
     * @tc.name      FilePreviewDLP_ViewWantOf_0074
     * @tc.desc      viewWantOf(uri="ZLw") returns "ZLw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0074 begin`);
      const actual: ViewWant = viewWantOf('ZLw');
      logInfo(`viewWantOf(uri="ZLw"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="ZLw"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('ZLw');
      logInfo(`${BUNDLE}ViewWantOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0075
     * @tc.name      FilePreviewDLP_ViewWantOf_0075
     * @tc.desc      viewWantOf(uri="akMgOFS0S") returns "akMgOFS0S"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0075 begin`);
      const actual: ViewWant = viewWantOf('akMgOFS0S');
      logInfo(`viewWantOf(uri="akMgOFS0S"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="akMgOFS0S"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('akMgOFS0S');
      logInfo(`${BUNDLE}ViewWantOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0076
     * @tc.name      FilePreviewDLP_ViewWantOf_0076
     * @tc.desc      viewWantOf(uri="WdXk3OmE") returns "WdXk3OmE"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0076 begin`);
      const actual: ViewWant = viewWantOf('WdXk3OmE');
      logInfo(`viewWantOf(uri="WdXk3OmE"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="WdXk3OmE"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('WdXk3OmE');
      logInfo(`${BUNDLE}ViewWantOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0077
     * @tc.name      FilePreviewDLP_ViewWantOf_0077
     * @tc.desc      viewWantOf(uri="H21kL") returns "H21kL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0077 begin`);
      const actual: ViewWant = viewWantOf('H21kL');
      logInfo(`viewWantOf(uri="H21kL"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="H21kL"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('H21kL');
      logInfo(`${BUNDLE}ViewWantOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0078
     * @tc.name      FilePreviewDLP_ViewWantOf_0078
     * @tc.desc      viewWantOf(uri="alSzwKI3ed") returns "alSzwKI3ed"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0078 begin`);
      const actual: ViewWant = viewWantOf('alSzwKI3ed');
      logInfo(`viewWantOf(uri="alSzwKI3ed"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="alSzwKI3ed"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('alSzwKI3ed');
      logInfo(`${BUNDLE}ViewWantOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0079
     * @tc.name      FilePreviewDLP_ViewWantOf_0079
     * @tc.desc      viewWantOf(uri="pEWrW6xZVPc") returns "pEWrW6xZVPc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0079 begin`);
      const actual: ViewWant = viewWantOf('pEWrW6xZVPc');
      logInfo(`viewWantOf(uri="pEWrW6xZVPc"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="pEWrW6xZVPc"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('pEWrW6xZVPc');
      logInfo(`${BUNDLE}ViewWantOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0080
     * @tc.name      FilePreviewDLP_ViewWantOf_0080
     * @tc.desc      viewWantOf(uri="HJD6fP") returns "HJD6fP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0080 begin`);
      const actual: ViewWant = viewWantOf('HJD6fP');
      logInfo(`viewWantOf(uri="HJD6fP"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="HJD6fP"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('HJD6fP');
      logInfo(`${BUNDLE}ViewWantOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0081
     * @tc.name      FilePreviewDLP_ViewWantOf_0081
     * @tc.desc      viewWantOf(uri="cLT4") returns "cLT4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0081 begin`);
      const actual: ViewWant = viewWantOf('cLT4');
      logInfo(`viewWantOf(uri="cLT4"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="cLT4"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('cLT4');
      logInfo(`${BUNDLE}ViewWantOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0082
     * @tc.name      FilePreviewDLP_ViewWantOf_0082
     * @tc.desc      viewWantOf(uri="bWzisXGGjX") returns "bWzisXGGjX"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0082 begin`);
      const actual: ViewWant = viewWantOf('bWzisXGGjX');
      logInfo(`viewWantOf(uri="bWzisXGGjX"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="bWzisXGGjX"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('bWzisXGGjX');
      logInfo(`${BUNDLE}ViewWantOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0083
     * @tc.name      FilePreviewDLP_ViewWantOf_0083
     * @tc.desc      viewWantOf(uri="PjKcb") returns "PjKcb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0083 begin`);
      const actual: ViewWant = viewWantOf('PjKcb');
      logInfo(`viewWantOf(uri="PjKcb"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="PjKcb"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('PjKcb');
      logInfo(`${BUNDLE}ViewWantOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0084
     * @tc.name      FilePreviewDLP_ViewWantOf_0084
     * @tc.desc      viewWantOf(uri="4D2i4") returns "4D2i4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0084 begin`);
      const actual: ViewWant = viewWantOf('4D2i4');
      logInfo(`viewWantOf(uri="4D2i4"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="4D2i4"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('4D2i4');
      logInfo(`${BUNDLE}ViewWantOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0085
     * @tc.name      FilePreviewDLP_ViewWantOf_0085
     * @tc.desc      viewWantOf(uri="JcfCz") returns "JcfCz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0085 begin`);
      const actual: ViewWant = viewWantOf('JcfCz');
      logInfo(`viewWantOf(uri="JcfCz"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="JcfCz"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('JcfCz');
      logInfo(`${BUNDLE}ViewWantOf_0085 end`);
    });
  });
}
