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
import {
  getPickerSelectedIndex,
  getPickerSelectedValues,
  INVALID_PICKER_INDEX,
  isMediaFileEmpty,
  isPickerIndexValid
} from '../../../main/ets/common/utils/MediaUtils';

export default function mediaUtilsTest(): void {
  describe('MediaUtilsTest', () => {
    it('shouldReadScalarAndArrayPickerIndexes', 0, () => {
      expect(getPickerSelectedIndex(1)).assertEqual(1);
      expect(getPickerSelectedIndex([2])).assertEqual(2);
      expect(getPickerSelectedIndex([3, 4])).assertEqual(3);
    });

    it('shouldNormalizePickerValues', 0, () => {
      expect(getPickerSelectedValues('X1')[0]).assertEqual('X1');
      expect(getPickerSelectedValues(['X1', 'X2'])[1]).assertEqual('X2');
    });

    it('shouldRejectEmptyPickerIndexArray', 0, () => {
      expect(getPickerSelectedIndex([])).assertEqual(INVALID_PICKER_INDEX);
    });

    it('shouldValidatePickerIndexRange', 0, () => {
      expect(isPickerIndexValid(0, 2)).assertTrue();
      expect(isPickerIndexValid(1, 2)).assertTrue();
      expect(isPickerIndexValid(-1, 2)).assertFalse();
      expect(isPickerIndexValid(2, 2)).assertFalse();
      expect(isPickerIndexValid(0, 0)).assertFalse();
    });

    it('shouldRecognizeEmptyMediaFiles', 0, () => {
      expect(isMediaFileEmpty(-1)).assertTrue();
      expect(isMediaFileEmpty(0)).assertTrue();
      expect(isMediaFileEmpty(1)).assertFalse();
    });
  });
}
