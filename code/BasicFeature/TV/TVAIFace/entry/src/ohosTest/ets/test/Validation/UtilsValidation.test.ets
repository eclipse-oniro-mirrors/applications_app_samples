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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { objType, drawImageSize } from '../../../../main/ets/utils/utils';

export default function utilsValidationTest(): void {
  describe('utilsValidation_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('obj_type_should_detect_array', 0, () => {
      expect(objType([])).assertEqual('array');
      expect(objType([1, 2, 3])).assertEqual('array');
    });

    it('obj_type_should_detect_object', 0, () => {
      expect(objType({})).assertEqual('object');
      expect(objType({ name: 'camera' })).assertEqual('object');
    });

    it('obj_type_should_detect_primitive_types', 0, () => {
      expect(objType(1)).assertEqual('number');
      expect(objType('text')).assertEqual('string');
      expect(objType(true)).assertEqual('boolean');
    });

    it('obj_type_should_detect_null_and_undefined', 0, () => {
      expect(objType(null)).assertEqual('null');
      expect(objType(undefined)).assertEqual('undefined');
    });

    it('draw_image_size_should_fill_square_canvas', 0, () => {
      const size = drawImageSize(100, 100, 200, 200);
      expect(size.width).assertEqual(200);
      expect(size.height).assertEqual(200);
      expect(size.x).assertEqual(0);
      expect(size.y).assertEqual(0);
    });

    it('draw_image_size_should_letterbox_wide_image', 0, () => {
      const size = drawImageSize(200, 100, 200, 200);
      expect(size.width).assertEqual(200);
      expect(size.height).assertEqual(100);
      expect(size.x).assertEqual(0);
      expect(size.y).assertEqual(50);
    });

    it('draw_image_size_should_pillarbox_tall_image', 0, () => {
      const size = drawImageSize(100, 200, 200, 200);
      expect(size.width).assertEqual(100);
      expect(size.height).assertEqual(200);
      expect(size.x).assertEqual(50);
      expect(size.y).assertEqual(0);
    });

    it('draw_image_size_should_center_on_wide_canvas', 0, () => {
      const size = drawImageSize(100, 100, 400, 200);
      expect(size.width).assertEqual(200);
      expect(size.height).assertEqual(200);
      expect(size.x).assertEqual(100);
      expect(size.y).assertEqual(0);
    });

    /* Business case 3564-4 for UtilsValidation */
    it('UtilsValidation_case_3564', 0, () => {
      const size = drawImageSize(104, 124, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3563-3 for UtilsValidation */
    it('UtilsValidation_case_3563', 0, () => {
      const size = drawImageSize(100, 3763, 200, 200);
      expect(size.height).assertEqual(200);
      expect(size.width).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
    });

    /* Business case 3562-2 for UtilsValidation */
    it('UtilsValidation_case_3562', 0, () => {
      const size = drawImageSize(3762, 100, 200, 200);
      expect(size.width).assertEqual(200);
      expect(size.height).assertLarger(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3561-1 for UtilsValidation */
    it('UtilsValidation_case_3561', 0, () => {
      expect(objType('value-3561')).assertEqual('string');
      expect(objType(true)).assertEqual('boolean');
      expect(objType(null)).assertEqual('null');
    });

    /* Business case 3560-0 for UtilsValidation */
    it('UtilsValidation_case_3560', 0, () => {
      expect(objType([3560, 3561])).assertEqual('array');
      expect(objType(3560)).assertEqual('number');
    });

    /* Business case 3559-9 for UtilsValidation */
    it('UtilsValidation_case_3559', 0, () => {
      const size = drawImageSize(139, 119, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3558-8 for UtilsValidation */
    it('UtilsValidation_case_3558', 0, () => {
      const size = drawImageSize(138, 118, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3557-7 for UtilsValidation */
    it('UtilsValidation_case_3557', 0, () => {
      const size = drawImageSize(137, 117, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3556-6 for UtilsValidation */
    it('UtilsValidation_case_3556', 0, () => {
      const size = drawImageSize(136, 116, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3555-5 for UtilsValidation */
    it('UtilsValidation_case_3555', 0, () => {
      const size = drawImageSize(135, 115, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3554-4 for UtilsValidation */
    it('UtilsValidation_case_3554', 0, () => {
      const size = drawImageSize(134, 114, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3553-3 for UtilsValidation */
    it('UtilsValidation_case_3553', 0, () => {
      const size = drawImageSize(100, 3753, 200, 200);
      expect(size.height).assertEqual(200);
      expect(size.width).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
    });

    /* Business case 3552-2 for UtilsValidation */
    it('UtilsValidation_case_3552', 0, () => {
      const size = drawImageSize(3752, 100, 200, 200);
      expect(size.width).assertEqual(200);
      expect(size.height).assertLarger(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3551-1 for UtilsValidation */
    it('UtilsValidation_case_3551', 0, () => {
      expect(objType('value-3551')).assertEqual('string');
      expect(objType(true)).assertEqual('boolean');
      expect(objType(null)).assertEqual('null');
    });

    /* Business case 3550-0 for UtilsValidation */
    it('UtilsValidation_case_3550', 0, () => {
      expect(objType([3550, 3551])).assertEqual('array');
      expect(objType(3550)).assertEqual('number');
    });

    /* Business case 3549-9 for UtilsValidation */
    it('UtilsValidation_case_3549', 0, () => {
      const size = drawImageSize(129, 109, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3548-8 for UtilsValidation */
    it('UtilsValidation_case_3548', 0, () => {
      const size = drawImageSize(128, 108, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3547-7 for UtilsValidation */
    it('UtilsValidation_case_3547', 0, () => {
      const size = drawImageSize(127, 107, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3546-6 for UtilsValidation */
    it('UtilsValidation_case_3546', 0, () => {
      const size = drawImageSize(126, 106, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3545-5 for UtilsValidation */
    it('UtilsValidation_case_3545', 0, () => {
      const size = drawImageSize(125, 105, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3544-4 for UtilsValidation */
    it('UtilsValidation_case_3544', 0, () => {
      const size = drawImageSize(124, 104, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3543-3 for UtilsValidation */
    it('UtilsValidation_case_3543', 0, () => {
      const size = drawImageSize(100, 3743, 200, 200);
      expect(size.height).assertEqual(200);
      expect(size.width).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
    });

    /* Business case 3542-2 for UtilsValidation */
    it('UtilsValidation_case_3542', 0, () => {
      const size = drawImageSize(3742, 100, 200, 200);
      expect(size.width).assertEqual(200);
      expect(size.height).assertLarger(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3541-1 for UtilsValidation */
    it('UtilsValidation_case_3541', 0, () => {
      expect(objType('value-3541')).assertEqual('string');
      expect(objType(true)).assertEqual('boolean');
      expect(objType(null)).assertEqual('null');
    });

    /* Business case 3540-0 for UtilsValidation */
    it('UtilsValidation_case_3540', 0, () => {
      expect(objType([3540, 3541])).assertEqual('array');
      expect(objType(3540)).assertEqual('number');
    });

    /* Business case 3539-9 for UtilsValidation */
    it('UtilsValidation_case_3539', 0, () => {
      const size = drawImageSize(119, 129, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3538-8 for UtilsValidation */
    it('UtilsValidation_case_3538', 0, () => {
      const size = drawImageSize(118, 128, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3537-7 for UtilsValidation */
    it('UtilsValidation_case_3537', 0, () => {
      const size = drawImageSize(117, 127, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3536-6 for UtilsValidation */
    it('UtilsValidation_case_3536', 0, () => {
      const size = drawImageSize(116, 126, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3535-5 for UtilsValidation */
    it('UtilsValidation_case_3535', 0, () => {
      const size = drawImageSize(115, 125, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3534-4 for UtilsValidation */
    it('UtilsValidation_case_3534', 0, () => {
      const size = drawImageSize(114, 124, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3533-3 for UtilsValidation */
    it('UtilsValidation_case_3533', 0, () => {
      const size = drawImageSize(100, 3733, 200, 200);
      expect(size.height).assertEqual(200);
      expect(size.width).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
    });

    /* Business case 3532-2 for UtilsValidation */
    it('UtilsValidation_case_3532', 0, () => {
      const size = drawImageSize(3732, 100, 200, 200);
      expect(size.width).assertEqual(200);
      expect(size.height).assertLarger(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3531-1 for UtilsValidation */
    it('UtilsValidation_case_3531', 0, () => {
      expect(objType('value-3531')).assertEqual('string');
      expect(objType(true)).assertEqual('boolean');
      expect(objType(null)).assertEqual('null');
    });

    /* Business case 3530-0 for UtilsValidation */
    it('UtilsValidation_case_3530', 0, () => {
      expect(objType([3530, 3531])).assertEqual('array');
      expect(objType(3530)).assertEqual('number');
    });

    /* Business case 3529-9 for UtilsValidation */
    it('UtilsValidation_case_3529', 0, () => {
      const size = drawImageSize(109, 119, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3528-8 for UtilsValidation */
    it('UtilsValidation_case_3528', 0, () => {
      const size = drawImageSize(108, 118, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3527-7 for UtilsValidation */
    it('UtilsValidation_case_3527', 0, () => {
      const size = drawImageSize(107, 117, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3526-6 for UtilsValidation */
    it('UtilsValidation_case_3526', 0, () => {
      const size = drawImageSize(106, 116, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3525-5 for UtilsValidation */
    it('UtilsValidation_case_3525', 0, () => {
      const size = drawImageSize(105, 115, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3524-4 for UtilsValidation */
    it('UtilsValidation_case_3524', 0, () => {
      const size = drawImageSize(104, 114, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3523-3 for UtilsValidation */
    it('UtilsValidation_case_3523', 0, () => {
      const size = drawImageSize(100, 3723, 200, 200);
      expect(size.height).assertEqual(200);
      expect(size.width).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
    });

    /* Business case 3522-2 for UtilsValidation */
    it('UtilsValidation_case_3522', 0, () => {
      const size = drawImageSize(3722, 100, 200, 200);
      expect(size.width).assertEqual(200);
      expect(size.height).assertLarger(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3521-1 for UtilsValidation */
    it('UtilsValidation_case_3521', 0, () => {
      expect(objType('value-3521')).assertEqual('string');
      expect(objType(true)).assertEqual('boolean');
      expect(objType(null)).assertEqual('null');
    });

    /* Business case 3520-0 for UtilsValidation */
    it('UtilsValidation_case_3520', 0, () => {
      expect(objType([3520, 3521])).assertEqual('array');
      expect(objType(3520)).assertEqual('number');
    });

    /* Business case 3519-9 for UtilsValidation */
    it('UtilsValidation_case_3519', 0, () => {
      const size = drawImageSize(139, 109, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3518-8 for UtilsValidation */
    it('UtilsValidation_case_3518', 0, () => {
      const size = drawImageSize(138, 108, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3517-7 for UtilsValidation */
    it('UtilsValidation_case_3517', 0, () => {
      const size = drawImageSize(137, 107, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3516-6 for UtilsValidation */
    it('UtilsValidation_case_3516', 0, () => {
      const size = drawImageSize(136, 106, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3515-5 for UtilsValidation */
    it('UtilsValidation_case_3515', 0, () => {
      const size = drawImageSize(135, 105, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3514-4 for UtilsValidation */
    it('UtilsValidation_case_3514', 0, () => {
      const size = drawImageSize(134, 104, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3513-3 for UtilsValidation */
    it('UtilsValidation_case_3513', 0, () => {
      const size = drawImageSize(100, 3713, 200, 200);
      expect(size.height).assertEqual(200);
      expect(size.width).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
    });

    /* Business case 3512-2 for UtilsValidation */
    it('UtilsValidation_case_3512', 0, () => {
      const size = drawImageSize(3712, 100, 200, 200);
      expect(size.width).assertEqual(200);
      expect(size.height).assertLarger(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3511-1 for UtilsValidation */
    it('UtilsValidation_case_3511', 0, () => {
      expect(objType('value-3511')).assertEqual('string');
      expect(objType(true)).assertEqual('boolean');
      expect(objType(null)).assertEqual('null');
    });

    /* Business case 3510-0 for UtilsValidation */
    it('UtilsValidation_case_3510', 0, () => {
      expect(objType([3510, 3511])).assertEqual('array');
      expect(objType(3510)).assertEqual('number');
    });

    /* Business case 3509-9 for UtilsValidation */
    it('UtilsValidation_case_3509', 0, () => {
      const size = drawImageSize(129, 129, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3508-8 for UtilsValidation */
    it('UtilsValidation_case_3508', 0, () => {
      const size = drawImageSize(128, 128, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3507-7 for UtilsValidation */
    it('UtilsValidation_case_3507', 0, () => {
      const size = drawImageSize(127, 127, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3506-6 for UtilsValidation */
    it('UtilsValidation_case_3506', 0, () => {
      const size = drawImageSize(126, 126, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3505-5 for UtilsValidation */
    it('UtilsValidation_case_3505', 0, () => {
      const size = drawImageSize(125, 125, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3504-4 for UtilsValidation */
    it('UtilsValidation_case_3504', 0, () => {
      const size = drawImageSize(124, 124, 200, 200);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3503-3 for UtilsValidation */
    it('UtilsValidation_case_3503', 0, () => {
      const size = drawImageSize(100, 3703, 200, 200);
      expect(size.height).assertEqual(200);
      expect(size.width).assertLarger(0);
      expect(size.x).assertLargerOrEqual(0);
    });

    /* Business case 3502-2 for UtilsValidation */
    it('UtilsValidation_case_3502', 0, () => {
      const size = drawImageSize(3702, 100, 200, 200);
      expect(size.width).assertEqual(200);
      expect(size.height).assertLarger(0);
      expect(size.y).assertLargerOrEqual(0);
    });

    /* Business case 3501-1 for UtilsValidation */
    it('UtilsValidation_case_3501', 0, () => {
      expect(objType('value-3501')).assertEqual('string');
      expect(objType(true)).assertEqual('boolean');
      expect(objType(null)).assertEqual('null');
    });

    /* Business case 3500-0 for UtilsValidation */
    it('UtilsValidation_case_3500', 0, () => {
      expect(objType([3500, 3501])).assertEqual('array');
      expect(objType(3500)).assertEqual('number');
    });

  });
}
