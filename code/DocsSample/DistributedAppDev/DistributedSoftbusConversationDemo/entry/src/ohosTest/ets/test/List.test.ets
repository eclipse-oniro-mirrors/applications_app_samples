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

import abilityTest from './Ability.test';
import conversationUiMatrixTest from './ConversationUiMatrix.test';
import conversationBundleMatrixTest from './ConversationBundleMatrix.test';
import conversationUiExtendedTest from './ConversationUiExtended.test';
import conversationUiFlowTest from './ConversationUiFlow.test';
import conversationUiRepeatedTest from './ConversationUiRepeated.test';
import conversationUiFinalTest from './ConversationUiFinal.test';
import conversationUiUltraTest from './ConversationUiUltra.test';
import conversationUiUltra2Test from './ConversationUiUltra2.test';
import conversationDiscoveryUltra2Test from './ConversationDiscoveryUltra2.test';
import conversationSessionUltra2Test from './ConversationSessionUltra2.test';
import conversationUiEdgeTest from './ConversationUiEdge.test';
import conversationPlusUiTest from './ConversationPlusUi.test';
export default function testsuite() {
  abilityTest();
  conversationUiMatrixTest();
  conversationBundleMatrixTest();
conversationUiExtendedTest();
conversationUiFlowTest();
conversationUiRepeatedTest();
conversationUiFinalTest();
  conversationUiUltraTest();
conversationUiUltra2Test();
  conversationDiscoveryUltra2Test();
  conversationSessionUltra2Test();
conversationUiEdgeTest();
conversationPlusUiTest();
}