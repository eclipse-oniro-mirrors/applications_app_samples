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

import { describe, beforeAll, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { StringUtils } from '../../../main/ets/common/utils/StringUtils';
import { NumberUtils } from '../../../main/ets/common/utils/NumberUtils';

/** Suite-level tag used only by beforeAll and afterAll logs. */
const SUITE_TAG: string = '[Sample_MeetingScene]';
/** Hilog domain reserved for the MeetingScene tests. */
const DOMAIN: number = 0xF811;
/** Package-name keyword prefixed to every log line so logs can be filtered by bundle. */
const BUNDLE: string = 'MeetingScene_';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'suite, beforeAll, begin');
    });
    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'suite, afterAll, end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_UNIT_COMMONUTILS_0100
     * @tc.name      testCommonUtils0001
     * @tc.desc      Verify the StringUtils and NumberUtils pure helpers return the
     *               documented results for boundary inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0001';
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
      // The empty string must be reported as empty by the null-safe helper.
      expect(StringUtils.isEmpty('')).assertTrue();
      // A non-empty string must not be reported as empty.
      expect(StringUtils.isEmpty('MeetingScene')).assertFalse();
      // A value inside the bounds is returned unchanged by clamp.
      expect(NumberUtils.clamp(5, 0, 10)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
    });
  });
}
