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
import DisplayDecodeLogic from './DisplayDecodeLogic.test';
import DisplayLimitLogic from './DisplayLimitLogic.test';
import IntlCollatorLogic from './IntlCollatorLogic.test';
import IntlDateTimeLogic from './IntlDateTimeLogic.test';
import IntlLocaleLogic from './IntlLocaleLogic.test';
import IntlNumberLogic from './IntlNumberLogic.test';
import IntlPluralLogic from './IntlPluralLogic.test';
import IntlRelativeLogic from './IntlRelativeLogic.test';
import IntlScientificLogic from './IntlScientificLogic.test';
import ResourceIdTraceLogic from './ResourceIdTraceLogic.test';
import ResourceObjectTraceLogic from './ResourceObjectTraceLogic.test';
import TextDecoderStreamLogic from './TextDecoderStreamLogic.test';
import ZeroWidthSpaceLogic from './ZeroWidthSpaceLogic.test';

export default function testsuite(): void {
  resourceManagerSyncTest();
  textDecodeTest();
  intlInterfaceTest();
  DisplayDecodeLogic();
  DisplayLimitLogic();
  IntlCollatorLogic();
  IntlDateTimeLogic();
  IntlLocaleLogic();
  IntlNumberLogic();
  IntlPluralLogic();
  IntlRelativeLogic();
  IntlScientificLogic();
  ResourceIdTraceLogic();
  ResourceObjectTraceLogic();
  TextDecoderStreamLogic();
  ZeroWidthSpaceLogic();
  const selected: string = abilityDelegatorRegistry.getArguments().parameters['class'] ?? '';
  const classes: string[] = selected.split(',');
  if (classes.every((name: string): boolean => name.split('#')[0] === 'EntryAbilityTest')) {
    abilityTest();
  }
}
