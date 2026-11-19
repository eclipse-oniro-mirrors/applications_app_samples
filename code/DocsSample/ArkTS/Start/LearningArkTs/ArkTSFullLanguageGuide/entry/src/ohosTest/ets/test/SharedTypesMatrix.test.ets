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

import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { canRead, getProfileName } from '../../../main/ets/pages/SharedTypesUsage';
import { UserIdentity } from '../../../main/ets/common/Types';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_SHARED]';

const IDS: number[] = [
  -40, -39, -38, -37, -36, -35, -34, -33, -32, -31, -30, -29, -28, -27, -26, -25,
  -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9,
  -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7,
  8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,
  24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
  40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55,
  56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71,
  72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87,
  88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103,
  104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119,
  120
];

function pad4(value: number): string {
  let text: string = value.toString();
  while (text.length < 4) {
    text = '0' + text;
  }
  return text;
}

/**
 * @tc.number    SUB_ARKTS_GUIDE_SHARED_testSharedTypesMatrix
 * @tc.name      testSharedTypesMatrix
 * @tc.desc      getProfileName/canRead follow the documented rules over the id matrix
 * @tc.type      FUNCTION
 * @tc.size      SMALLTEST
 * @tc.level     LEVEL1
 */
export default function SharedTypesMatrixTest(): void {
  describe('SharedTypesMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })

    IDS.forEach((id: number, index: number): void => {
      const name: string = 'testSharedTypesMatrix' + pad4(index + 1);
      it(name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin, id=' + id.toString());
        const identity: UserIdentity = { id: id };
        const expectedName: string = 'user-' + id.toString();
        const expectedRead: boolean = id > 0;
        expect(getProfileName(identity)).assertEqual(expectedName);
        expect(getProfileName(identity).startsWith('user-')).assertTrue();
        expect(getProfileName(identity).length).assertEqual(expectedName.length);
        expect(canRead(identity)).assertEqual(expectedRead);
        expect(typeof canRead(identity)).assertEqual('boolean');
        hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
      })
    })
  })
}
