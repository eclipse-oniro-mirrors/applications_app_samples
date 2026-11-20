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

import simpleKeyboardTest from './SimpleKeyboard.test';
import abilityTest from './Ability.test';
import HardKeyAlphabetEditingCoreTest from './HardKeyAlphabetEditingCore.test';
import HardKeyAlphabetEditingExtendedTest from './HardKeyAlphabetEditingExtended.test';
import HardKeyAlphabetEditingAdvancedTest from './HardKeyAlphabetEditingAdvanced.test';
import HardKeyAlphabetEditingTailTest from './HardKeyAlphabetEditingTail.test';
import HardKeyNavigationNumberCoreTest from './HardKeyNavigationNumberCore.test';
import HardKeyNavigationNumberExtendedTest from './HardKeyNavigationNumberExtended.test';
import HardKeyNavigationNumberAdvancedTest from './HardKeyNavigationNumberAdvanced.test';
import HardKeyNavigationNumberTailTest from './HardKeyNavigationNumberTail.test';
import HardKeyPunctuationShiftCoreTest from './HardKeyPunctuationShiftCore.test';
import HardKeyPunctuationShiftExtendedTest from './HardKeyPunctuationShiftExtended.test';
import HardKeyPunctuationShiftAdvancedTest from './HardKeyPunctuationShiftAdvanced.test';
import HardKeyPunctuationShiftTailTest from './HardKeyPunctuationShiftTail.test';
import HardKeyExtendedBoundsCoreTest from './HardKeyExtendedBoundsCore.test';
import HardKeyExtendedBoundsExtendedTest from './HardKeyExtendedBoundsExtended.test';
import HardKeyExtendedBoundsAdvancedTest from './HardKeyExtendedBoundsAdvanced.test';
import HardKeyExtendedBoundsTailTest from './HardKeyExtendedBoundsTail.test';
import HardKeyExtendedTailCoreTest from './HardKeyExtendedTailCore.test';
import HardKeyExtendedTailExtendedTest from './HardKeyExtendedTailExtended.test';
import HardKeyExtendedTailAdvancedTest from './HardKeyExtendedTailAdvanced.test';
import HardKeyExtendedTailTailTest from './HardKeyExtendedTailTail.test';
import HardKeyBoundaryExtremesCoreTest from './HardKeyBoundaryExtremesCore.test';
import HardKeyBoundaryExtremesExtendedTest from './HardKeyBoundaryExtremesExtended.test';
import HardKeyBoundaryExtremesAdvancedTest from './HardKeyBoundaryExtremesAdvanced.test';
import HardKeyBoundaryExtremesTailTest from './HardKeyBoundaryExtremesTail.test';
import HardKeyReservedAlphabetEditingCoreTest from './HardKeyReservedAlphabetEditingCore.test';
import HardKeyReservedAlphabetEditingExtendedTest from './HardKeyReservedAlphabetEditingExtended.test';
import HardKeyReservedAlphabetEditingAdvancedTest from './HardKeyReservedAlphabetEditingAdvanced.test';
import HardKeyReservedAlphabetEditingTailTest from './HardKeyReservedAlphabetEditingTail.test';
import HardKeyReservedNavigationNumberCoreTest from './HardKeyReservedNavigationNumberCore.test';
import HardKeyReservedNavigationNumberExtendedTest from './HardKeyReservedNavigationNumberExtended.test';
import HardKeyReservedNavigationNumberAdvancedTest from './HardKeyReservedNavigationNumberAdvanced.test';
import HardKeyReservedNavigationNumberTailTest from './HardKeyReservedNavigationNumberTail.test';
import HardKeyReservedPunctuationShiftCoreTest from './HardKeyReservedPunctuationShiftCore.test';
import HardKeyReservedPunctuationShiftExtendedTest from './HardKeyReservedPunctuationShiftExtended.test';
import HardKeyReservedPunctuationShiftAdvancedTest from './HardKeyReservedPunctuationShiftAdvanced.test';
import HardKeyReservedPunctuationShiftTailTest from './HardKeyReservedPunctuationShiftTail.test';
import HardKeyReservedExtensionHighCoreTest from './HardKeyReservedExtensionHighCore.test';
import HardKeyReservedExtensionHighExtendedTest from './HardKeyReservedExtensionHighExtended.test';
import HardKeyReservedExtensionHighAdvancedTest from './HardKeyReservedExtensionHighAdvanced.test';
import HardKeyReservedExtensionHighTailTest from './HardKeyReservedExtensionHighTail.test';
import HardKeyReservedExtensionLowCoreTest from './HardKeyReservedExtensionLowCore.test';
import HardKeyReservedExtensionLowExtendedTest from './HardKeyReservedExtensionLowExtended.test';
import HardKeyReservedExtensionLowAdvancedTest from './HardKeyReservedExtensionLowAdvanced.test';
import HardKeyReservedExtensionLowTailTest from './HardKeyReservedExtensionLowTail.test';
import HardKeyReservedExtensionUpperCoreTest from './HardKeyReservedExtensionUpperCore.test';
import HardKeyReservedExtensionUpperExtendedTest from './HardKeyReservedExtensionUpperExtended.test';
import HardKeyReservedExtensionUpperAdvancedTest from './HardKeyReservedExtensionUpperAdvanced.test';
import HardKeyReservedExtensionUpperTailTest from './HardKeyReservedExtensionUpperTail.test';
import KeyDataAlphabetCoreTest from './KeyDataAlphabetCore.test';
import KeyDataAlphabetExtendedTest from './KeyDataAlphabetExtended.test';
import KeyDataAlphabetTailTest from './KeyDataAlphabetTail.test';
import KeyDataNumberSymbolCoreTest from './KeyDataNumberSymbolCore.test';
import KeyDataNumberSymbolExtendedTest from './KeyDataNumberSymbolExtended.test';
import KeyDataNumberSymbolAdvancedTest from './KeyDataNumberSymbolAdvanced.test';
import KeyDataNumberSymbolTailTest from './KeyDataNumberSymbolTail.test';
import KeyDataMenuStateCoreTest from './KeyDataMenuStateCore.test';
import KeyDataMenuStateExtendedTest from './KeyDataMenuStateExtended.test';
import KeyDataMenuStateTailTest from './KeyDataMenuStateTail.test';
import KeyDataSequencesCoreTest from './KeyDataSequencesCore.test';
import KeyDataSequencesTailTest from './KeyDataSequencesTail.test';
import KeyboardControllerRangesCoreTest from './KeyboardControllerRangesCore.test';
import KeyboardControllerRangesExtendedTest from './KeyboardControllerRangesExtended.test';
import KeyboardControllerRangesAdvancedTest from './KeyboardControllerRangesAdvanced.test';
import KeyboardControllerRangesTailTest from './KeyboardControllerRangesTail.test';
import KeyboardControllerKeyEventsCoreTest from './KeyboardControllerKeyEventsCore.test';
import KeyboardControllerKeyEventsTailTest from './KeyboardControllerKeyEventsTail.test';
import KeyboardControllerSequencesCoreTest from './KeyboardControllerSequencesCore.test';
import KeyboardControllerSequencesExtendedTest from './KeyboardControllerSequencesExtended.test';
import KeyboardControllerSequencesAdvancedTest from './KeyboardControllerSequencesAdvanced.test';
import KeyboardControllerSequencesTailTest from './KeyboardControllerSequencesTail.test';
import KeyboardControllerModifiersTest from './KeyboardControllerModifiers.test';
import keyboardUiStateTest from './KeyboardUiState.test';

export default function testsuite() {
  simpleKeyboardTest();
  abilityTest();
  HardKeyAlphabetEditingCoreTest();
  HardKeyAlphabetEditingExtendedTest();
  HardKeyAlphabetEditingAdvancedTest();
  HardKeyAlphabetEditingTailTest();
  HardKeyNavigationNumberCoreTest();
  HardKeyNavigationNumberExtendedTest();
  HardKeyNavigationNumberAdvancedTest();
  HardKeyNavigationNumberTailTest();
  HardKeyPunctuationShiftCoreTest();
  HardKeyPunctuationShiftExtendedTest();
  HardKeyPunctuationShiftAdvancedTest();
  HardKeyPunctuationShiftTailTest();
  HardKeyExtendedBoundsCoreTest();
  HardKeyExtendedBoundsExtendedTest();
  HardKeyExtendedBoundsAdvancedTest();
  HardKeyExtendedBoundsTailTest();
  HardKeyExtendedTailCoreTest();
  HardKeyExtendedTailExtendedTest();
  HardKeyExtendedTailAdvancedTest();
  HardKeyExtendedTailTailTest();
  HardKeyBoundaryExtremesCoreTest();
  HardKeyBoundaryExtremesExtendedTest();
  HardKeyBoundaryExtremesAdvancedTest();
  HardKeyBoundaryExtremesTailTest();
  HardKeyReservedAlphabetEditingCoreTest();
  HardKeyReservedAlphabetEditingExtendedTest();
  HardKeyReservedAlphabetEditingAdvancedTest();
  HardKeyReservedAlphabetEditingTailTest();
  HardKeyReservedNavigationNumberCoreTest();
  HardKeyReservedNavigationNumberExtendedTest();
  HardKeyReservedNavigationNumberAdvancedTest();
  HardKeyReservedNavigationNumberTailTest();
  HardKeyReservedPunctuationShiftCoreTest();
  HardKeyReservedPunctuationShiftExtendedTest();
  HardKeyReservedPunctuationShiftAdvancedTest();
  HardKeyReservedPunctuationShiftTailTest();
  HardKeyReservedExtensionHighCoreTest();
  HardKeyReservedExtensionHighExtendedTest();
  HardKeyReservedExtensionHighAdvancedTest();
  HardKeyReservedExtensionHighTailTest();
  HardKeyReservedExtensionLowCoreTest();
  HardKeyReservedExtensionLowExtendedTest();
  HardKeyReservedExtensionLowAdvancedTest();
  HardKeyReservedExtensionLowTailTest();
  HardKeyReservedExtensionUpperCoreTest();
  HardKeyReservedExtensionUpperExtendedTest();
  HardKeyReservedExtensionUpperAdvancedTest();
  HardKeyReservedExtensionUpperTailTest();
  KeyDataAlphabetCoreTest();
  KeyDataAlphabetExtendedTest();
  KeyDataAlphabetTailTest();
  KeyDataNumberSymbolCoreTest();
  KeyDataNumberSymbolExtendedTest();
  KeyDataNumberSymbolAdvancedTest();
  KeyDataNumberSymbolTailTest();
  KeyDataMenuStateCoreTest();
  KeyDataMenuStateExtendedTest();
  KeyDataMenuStateTailTest();
  KeyDataSequencesCoreTest();
  KeyDataSequencesTailTest();
  KeyboardControllerRangesCoreTest();
  KeyboardControllerRangesExtendedTest();
  KeyboardControllerRangesAdvancedTest();
  KeyboardControllerRangesTailTest();
  KeyboardControllerKeyEventsCoreTest();
  KeyboardControllerKeyEventsTailTest();
  KeyboardControllerSequencesCoreTest();
  KeyboardControllerSequencesExtendedTest();
  KeyboardControllerSequencesAdvancedTest();
  KeyboardControllerSequencesTailTest();
  KeyboardControllerModifiersTest();
  keyboardUiStateTest();
}
