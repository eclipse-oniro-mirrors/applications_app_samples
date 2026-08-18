/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it } from '@ohos/hypium';
import DateTimeUtil, { dateTime, getShownTimer } from '../../../main/ets/common/utils/DateTimeUtils';

export default function dateTimeUtilsTest(): void {
  describe('DateTimeUtilsTest', () => {
    it('shouldPadSingleDigitTimeFields', 0, () => {
      const dateTimeUtil = new DateTimeUtil();
      expect(dateTimeUtil.fill(0)).assertEqual('00');
      expect(dateTimeUtil.fill(9)).assertEqual('09');
      expect(dateTimeUtil.fill(10)).assertEqual('10');
      expect(dateTimeUtil.concatTime(1, 2, 3)).assertEqual('010203');
    });

    it('shouldFormatDateFieldsInOrder', 0, () => {
      const dateTimeUtil = new DateTimeUtil();
      expect(dateTimeUtil.concatDate(2026, 8, 3)).assertEqual('202683');
    });

    it('shouldFormatMillisecondsAsMinuteSecond', 0, () => {
      expect(getShownTimer(0)).assertEqual('00:00');
      expect(getShownTimer(1000)).assertEqual('00:01');
      expect(getShownTimer(59000)).assertEqual('00:59');
      expect(getShownTimer(60000)).assertEqual('01:00');
    });

    it('shouldFormatSecondsAsMinuteSecond', 0, () => {
      expect(dateTime(0)).assertEqual('00:00');
      expect(dateTime(9)).assertEqual('00:09');
      expect(dateTime(65)).assertEqual('01:05');
      expect(dateTime(3599)).assertEqual('59:59');
    });
  });
}
