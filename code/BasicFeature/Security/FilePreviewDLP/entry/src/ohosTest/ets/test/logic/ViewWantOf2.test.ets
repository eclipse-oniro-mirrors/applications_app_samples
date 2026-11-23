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

/** Logic checks for viewWantOf (5 cases). */
export default function viewWantOf2Test(): void {
  describe('ViewWantOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0086
     * @tc.name      FilePreviewDLP_ViewWantOf_0086
     * @tc.desc      viewWantOf(uri="3") returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0086 begin`);
      const actual: ViewWant = viewWantOf('3');
      logInfo(`viewWantOf(uri="3"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="3"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('3');
      logInfo(`${BUNDLE}ViewWantOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0087
     * @tc.name      FilePreviewDLP_ViewWantOf_0087
     * @tc.desc      viewWantOf(uri="Up") returns "Up"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0087 begin`);
      const actual: ViewWant = viewWantOf('Up');
      logInfo(`viewWantOf(uri="Up"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="Up"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('Up');
      logInfo(`${BUNDLE}ViewWantOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0088
     * @tc.name      FilePreviewDLP_ViewWantOf_0088
     * @tc.desc      viewWantOf(uri="AB0HAjUYAIVs") returns "AB0HAjUYAIVs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0088 begin`);
      const actual: ViewWant = viewWantOf('AB0HAjUYAIVs');
      logInfo(`viewWantOf(uri="AB0HAjUYAIVs"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="AB0HAjUYAIVs"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('AB0HAjUYAIVs');
      logInfo(`${BUNDLE}ViewWantOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0089
     * @tc.name      FilePreviewDLP_ViewWantOf_0089
     * @tc.desc      viewWantOf(uri="9RKCk") returns "9RKCk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0089 begin`);
      const actual: ViewWant = viewWantOf('9RKCk');
      logInfo(`viewWantOf(uri="9RKCk"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="9RKCk"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('9RKCk');
      logInfo(`${BUNDLE}ViewWantOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_VIEW_WANT_OF_0090
     * @tc.name      FilePreviewDLP_ViewWantOf_0090
     * @tc.desc      viewWantOf(uri="VcuH") returns "VcuH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ViewWantOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ViewWantOf_0090 begin`);
      const actual: ViewWant = viewWantOf('VcuH');
      logInfo(`viewWantOf(uri="VcuH"): actual.action=${actual.action}`);
      expect(actual.action).assertEqual('ohos.want.action.viewData');
      logInfo(`viewWantOf(uri="VcuH"): actual.uri=${actual.uri}`);
      expect(actual.uri).assertEqual('VcuH');
      logInfo(`${BUNDLE}ViewWantOf_0090 end`);
    });
  });
}
