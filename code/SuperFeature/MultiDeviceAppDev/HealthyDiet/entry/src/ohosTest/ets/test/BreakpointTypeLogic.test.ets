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

import { describe, it, expect } from '@ohos/hypium';
import { BreakPointType } from '../../../main/ets/common/BreakpointSystem';

const DATASET = 'BreakPointTypeTest_';

export default function breakpointTypeLogicTest() {
  describe('HealthyDietBreakPointType', () => {
    /**
     * All six breakpoints return their configured values
     */
    it(DATASET + 'getValue_001', 0, () => {
      const type: BreakPointType<number> = new BreakPointType<number>({
        xs: 1,
        sm: 2,
        md: 3,
        lg: 4,
        xl: 5,
        xxl: 6
      });
      expect(type.getValue('xs')).assertEqual(1);
      expect(type.getValue('sm')).assertEqual(2);
      expect(type.getValue('md')).assertEqual(3);
      expect(type.getValue('lg')).assertEqual(4);
      expect(type.getValue('xl')).assertEqual(5);
      expect(type.getValue('xxl')).assertEqual(6);
    })

    /**
     * Unknown breakpoint name returns undefined
     */
    it(DATASET + 'getValue_002', 0, () => {
      const type: BreakPointType<number> = new BreakPointType<number>({ md: 3 });
      expect(type.getValue('md')).assertEqual(3);
      expect(type.getValue('unknown') === undefined).assertTrue();
    })

    /**
     * Empty breakpoint name returns undefined
     */
    it(DATASET + 'getValue_003', 0, () => {
      const type: BreakPointType<string> = new BreakPointType<string>({ sm: 'small' });
      expect(type.getValue('') === undefined).assertTrue();
    })

    /**
     * Unconfigured breakpoint returns undefined
     */
    it(DATASET + 'getValue_004', 0, () => {
      const type: BreakPointType<string> = new BreakPointType<string>({ sm: 'small' });
      expect(type.getValue('sm')).assertEqual('small');
      expect(type.getValue('lg') === undefined).assertTrue();
    })

    /**
     * Breakpoint name is case sensitive
     */
    it(DATASET + 'getValue_005', 0, () => {
      const type: BreakPointType<number> = new BreakPointType<number>({ lg: 4 });
      expect(type.getValue('lg')).assertEqual(4);
      expect(type.getValue('LG') === undefined).assertTrue();
    })

    /**
     * Custom value type is returned as configured
     */
    it(DATASET + 'getValue_006', 0, () => {
      const type: BreakPointType<string> = new BreakPointType<string>({ md: 'medium', lg: 'large' });
      expect(type.getValue('md')).assertEqual('medium');
      expect(type.getValue('lg')).assertEqual('large');
    })
  })
}
