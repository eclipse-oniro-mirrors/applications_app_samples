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
  cameraErrorIsFatal,
  routeToEditPage,
} from '../model/ResolutionLogic';

/** ErrorAndRouteTest logic checks (6 cases). */
export default function errorAndRouteTest(): void {
  describe('ErrorAndRouteTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_ERROR_ROUTE_0001
     * @tc.name      Resolution_ErrorRoute_0001
     * @tc.desc      camera error 0 and edit route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ErrorRoute_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ErrorRoute_0001 begin`);
      logInfo("cameraErrorIsFatal(0) + ':' + routeToEditPage()");
      const actual: string = cameraErrorIsFatal(0) + ':' + routeToEditPage();
      logInfo('actual=' + String(actual) + ', expected=' + "false:pages/EditPage");
      expect(actual).assertEqual("false:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ErrorRoute_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ERROR_ROUTE_0002
     * @tc.name      Resolution_ErrorRoute_0002
     * @tc.desc      camera error -1 and edit route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ErrorRoute_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ErrorRoute_0002 begin`);
      logInfo("cameraErrorIsFatal(-1) + ':' + routeToEditPage()");
      const actual: string = cameraErrorIsFatal(-1) + ':' + routeToEditPage();
      logInfo('actual=' + String(actual) + ', expected=' + "false:pages/EditPage");
      expect(actual).assertEqual("false:pages/EditPage");
      logInfo(`${BUNDLE}ErrorRoute_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ERROR_ROUTE_0003
     * @tc.name      Resolution_ErrorRoute_0003
     * @tc.desc      camera error 7400101 and edit route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ErrorRoute_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ErrorRoute_0003 begin`);
      logInfo("cameraErrorIsFatal(7400101) + ':' + routeToEditPage()");
      const actual: string = cameraErrorIsFatal(7400101) + ':' + routeToEditPage();
      logInfo('actual=' + String(actual) + ', expected=' + "true:pages/EditPage");
      expect(actual).assertEqual("true:pages/EditPage");
      logInfo(`${BUNDLE}ErrorRoute_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ERROR_ROUTE_0004
     * @tc.name      Resolution_ErrorRoute_0004
     * @tc.desc      camera error 7400102 and edit route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ErrorRoute_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ErrorRoute_0004 begin`);
      logInfo("cameraErrorIsFatal(7400102) + ':' + routeToEditPage()");
      const actual: string = cameraErrorIsFatal(7400102) + ':' + routeToEditPage();
      logInfo('actual=' + String(actual) + ', expected=' + "false:pages/EditPage");
      expect(actual).assertEqual("false:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ErrorRoute_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ERROR_ROUTE_0005
     * @tc.name      Resolution_ErrorRoute_0005
     * @tc.desc      camera error 7400201 and edit route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ErrorRoute_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ErrorRoute_0005 begin`);
      logInfo("cameraErrorIsFatal(7400201) + ':' + routeToEditPage()");
      const actual: string = cameraErrorIsFatal(7400201) + ':' + routeToEditPage();
      logInfo('actual=' + String(actual) + ', expected=' + "false:pages/EditPage");
      expect(actual).assertEqual("false:pages/EditPage");
      logInfo(`${BUNDLE}ErrorRoute_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ERROR_ROUTE_0006
     * @tc.name      Resolution_ErrorRoute_0006
     * @tc.desc      camera error 7400103 and edit route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ErrorRoute_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ErrorRoute_0006 begin`);
      logInfo("cameraErrorIsFatal(7400103) + ':' + routeToEditPage()");
      const actual: string = cameraErrorIsFatal(7400103) + ':' + routeToEditPage();
      logInfo('actual=' + String(actual) + ', expected=' + "false:pages/EditPage");
      expect(actual).assertEqual("false:pages/EditPage");
      logInfo(`${BUNDLE}ErrorRoute_0006 end`);
    });
  });
}
