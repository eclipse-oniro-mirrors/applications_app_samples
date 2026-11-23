/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  pageReloadToggle,
  deleteVideoFileName,
} from '../model/ResolutionLogic';

/** PageReloadTest logic checks (4 cases). */
export default function pageReloadTest(): void {
  describe('PageReloadTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_RELOAD_0001
     * @tc.name      Resolution_PageReload_0001
     * @tc.desc      page reload/delete guard for flag=true, name="a.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_PageReload_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageReload_0001 begin`);
      logInfo("pageReloadToggle(true) + ':' + deleteVideoFileName(\"a.mp4\")");
      const actual: string = pageReloadToggle(true) + ':' + deleteVideoFileName("a.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageReload_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_RELOAD_0002
     * @tc.name      Resolution_PageReload_0002
     * @tc.desc      page reload/delete guard for flag=false, name="".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageReload_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageReload_0002 begin`);
      logInfo("pageReloadToggle(false) + ':' + deleteVideoFileName(\"\")");
      const actual: string = pageReloadToggle(false) + ':' + deleteVideoFileName("");
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}PageReload_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_RELOAD_0003
     * @tc.name      Resolution_PageReload_0003
     * @tc.desc      page reload/delete guard for flag=true, name="".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageReload_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageReload_0003 begin`);
      logInfo("pageReloadToggle(true) + ':' + deleteVideoFileName(\"\")");
      const actual: string = pageReloadToggle(true) + ':' + deleteVideoFileName("");
      logInfo('actual=' + String(actual) + ', expected=' + "false:false");
      expect(actual).assertEqual("false:false");
      logInfo(`${BUNDLE}PageReload_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PAGE_RELOAD_0004
     * @tc.name      Resolution_PageReload_0004
     * @tc.desc      page reload/delete guard for flag=false, name="a.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_PageReload_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageReload_0004 begin`);
      logInfo("pageReloadToggle(false) + ':' + deleteVideoFileName(\"a.mp4\")");
      const actual: string = pageReloadToggle(false) + ':' + deleteVideoFileName("a.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}PageReload_0004 end`);
    });
  });
}
