/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { abilityDelegatorRegistry } from '@kit.TestKit';
import abilityTest from './Ability.test';
import resourceManagerSyncTest from './ResourceManagerSync.test';
import textDecodeTest from './TextDecode.test';
import intlInterfaceTest from './IntlInterface.test';
import displayDecodeLogic from './DisplayDecodeLogic.test';
import displayLimitLogic from './DisplayLimitLogic.test';
import intlCollatorLogic from './IntlCollatorLogic.test';
import intlDateTimeLogic from './IntlDateTimeLogic.test';
import intlLocaleLogic from './IntlLocaleLogic.test';
import intlNumberLogic from './IntlNumberLogic.test';
import intlPluralLogic from './IntlPluralLogic.test';
import intlRelativeLogic from './IntlRelativeLogic.test';
import intlScientificLogic from './IntlScientificLogic.test';
import resourceIdTraceLogic from './ResourceIdTraceLogic.test';
import resourceObjectTraceLogic from './ResourceObjectTraceLogic.test';
import textDecoderStreamLogic from './TextDecoderStreamLogic.test';
import zeroWidthSpaceLogic from './ZeroWidthSpaceLogic.test';

export default function testsuite(): void {
  resourceManagerSyncTest();
  textDecodeTest();
  intlInterfaceTest();
  displayDecodeLogic();
  displayLimitLogic();
  intlCollatorLogic();
  intlDateTimeLogic();
  intlLocaleLogic();
  intlNumberLogic();
  intlPluralLogic();
  intlRelativeLogic();
  intlScientificLogic();
  resourceIdTraceLogic();
  resourceObjectTraceLogic();
  textDecoderStreamLogic();
  zeroWidthSpaceLogic();
  const selected: string = abilityDelegatorRegistry.getArguments().parameters['class'] ?? '';
  const classes: string[] = selected.split(',');
  // EntryAbilityTest starts a real ability, so run it only when the caller explicitly selects it.
  if (classes.some((name: string): boolean => name.split('#')[0] === 'EntryAbilityTest')) {
    abilityTest();
  }
}
