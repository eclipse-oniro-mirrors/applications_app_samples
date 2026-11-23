/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import abilityTest from './Ability.test'
import aesEncryptTest from './AesEncrypt.test'
import aesEncryptVolume01Test from './AesEncryptVolume01.test'
import aesEncryptVolume02Test from './AesEncryptVolume02.test'
import aesEncryptVolume03Test from './AesEncryptVolume03.test'
import aesDecryptTest from './AesDecrypt.test'
import aesDecryptVolume01Test from './AesDecryptVolume01.test'
import aesDecryptVolume02Test from './AesDecryptVolume02.test'
import aesDecryptVolume03Test from './AesDecryptVolume03.test'
import rsaEncryptTest from './RsaEncrypt.test'
import rsaEncryptVolume01Test from './RsaEncryptVolume01.test'
import rsaDecryptTest from './RsaDecrypt.test'
import rsaDecryptVolume01Test from './RsaDecryptVolume01.test'
import stateSequenceTest from './StateSequence.test'
import uiFlowTest from './UiFlow.test'
import uiFlowVolume01Test from './UiFlowVolume01.test'

export default function testsuite() {
  abilityTest()
  aesEncryptTest()
  aesEncryptVolume01Test()
  aesEncryptVolume02Test()
  aesEncryptVolume03Test()
  aesDecryptTest()
  aesDecryptVolume01Test()
  aesDecryptVolume02Test()
  aesDecryptVolume03Test()
  rsaEncryptTest()
  rsaEncryptVolume01Test()
  rsaDecryptTest()
  rsaDecryptVolume01Test()
  stateSequenceTest()
  uiFlowTest()
  uiFlowVolume01Test()
}
