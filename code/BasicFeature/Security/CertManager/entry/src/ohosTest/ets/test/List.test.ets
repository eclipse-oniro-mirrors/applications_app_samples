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

import dataDisplayCore from './DataDisplayCore.test';
import dataDisplaySeq from './DataDisplaySeq.test';
import modifyOriginCore from './ModifyOriginCore.test';
import modifyOriginSeq from './ModifyOriginSeq.test';
import modifySignatureCore from './ModifySignatureCore.test';
import modifySignatureSeq from './ModifySignatureSeq.test';
import installCore from './InstallCore.test';
import installSeq from './InstallSeq.test';
import signCore from './SignCore.test';
import signSeq from './SignSeq.test';
import verifyCore from './VerifyCore.test';
import verifySeq from './VerifySeq.test';
import uiCore from './UiCore.test';
import uiSeq from './UiSeq.test';
import apiSmoke from './ApiSmoke.test';

export default function testsuite() {
  dataDisplayCore();
  dataDisplaySeq();
  modifyOriginCore();
  modifyOriginSeq();
  modifySignatureCore();
  modifySignatureSeq();
  installCore();
  installSeq();
  signCore();
  signSeq();
  verifyCore();
  verifySeq();
  uiCore();
  uiSeq();
  apiSmoke();
}
