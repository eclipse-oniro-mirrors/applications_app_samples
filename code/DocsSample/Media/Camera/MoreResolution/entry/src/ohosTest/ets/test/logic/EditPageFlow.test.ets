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
  EditPageModel,
} from '../model/ResolutionLogic';

/** EditPageFlowTest logic checks (6 cases). */
export default function editPageFlowTest(): void {
  describe('EditPageFlowTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_EDIT_FLOW_0001
     * @tc.name      Resolution_EditFlow_0001
     * @tc.desc      edit page video controls after 1 clicks (finish=true).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_EditFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditFlow_0001 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://1', 'files', '1.mp4');
      subject.clickVideo();
      subject.finishVideo();
      logInfo("edit video clicks=1 finish=true");
      const actual: string = subject.controlsValue() + ':' + subject.backValue();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EDIT_FLOW_0002
     * @tc.name      Resolution_EditFlow_0002
     * @tc.desc      edit page video controls after 2 clicks (finish=false).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EditFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditFlow_0002 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://1', 'files', '1.mp4');
      subject.clickVideo();
      subject.clickVideo();
      logInfo("edit video clicks=2 finish=false");
      const actual: string = subject.controlsValue() + ':' + subject.backValue();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EDIT_FLOW_0003
     * @tc.name      Resolution_EditFlow_0003
     * @tc.desc      edit page video controls after 3 clicks (finish=true).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EditFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditFlow_0003 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://1', 'files', '1.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.finishVideo();
      logInfo("edit video clicks=3 finish=true");
      const actual: string = subject.controlsValue() + ':' + subject.backValue();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EDIT_FLOW_0004
     * @tc.name      Resolution_EditFlow_0004
     * @tc.desc      edit page video controls after 4 clicks (finish=false).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EditFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditFlow_0004 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://1', 'files', '1.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      logInfo("edit video clicks=4 finish=false");
      const actual: string = subject.controlsValue() + ':' + subject.backValue();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EDIT_FLOW_0005
     * @tc.name      Resolution_EditFlow_0005
     * @tc.desc      edit page video controls after 5 clicks (finish=true).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EditFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditFlow_0005 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://1', 'files', '1.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.finishVideo();
      logInfo("edit video clicks=5 finish=true");
      const actual: string = subject.controlsValue() + ':' + subject.backValue();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EDIT_FLOW_0006
     * @tc.name      Resolution_EditFlow_0006
     * @tc.desc      edit page video controls after 6 clicks (finish=false).
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EditFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditFlow_0006 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://1', 'files', '1.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      logInfo("edit video clicks=6 finish=false");
      const actual: string = subject.controlsValue() + ':' + subject.backValue();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditFlow_0006 end`);
    });
  });
}
