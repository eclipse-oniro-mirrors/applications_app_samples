/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import aesKeyCore from './AesKeyCore.test';
import aesCipherCore from './AesCipherCore.test';
import rsaKeyCore from './RsaKeyCore.test';
import rsaSignVerifyCore from './RsaSignVerifyCore.test';
import textFileCore from './TextFileCore.test';
import aesKeySeqTest from './AesKeySeqVolume01.test';
import aesChrTest from './AesChrVolume01.test';
import aesSeqTest from './AesSeqVolume01.test';
import aesSeq2Test from './AesSeqVolume02.test';
import aesStateTest from './AesStateVolume01.test';
import rsaKeySeqTest from './RsaKeySeqVolume01.test';
import rsaSeqTest from './RsaSeqVolume01.test';
import rsaSeq2Test from './RsaSeqVolume02.test';
import rsaTampTest from './RsaTampVolume01.test';
import rsaStateTest from './RsaStateVolume01.test';
import aesChainTest from './AESCHAINVolume01.test';
import aesCtTamp1Test from './AESCTAM1Volume01.test';
import aesCtTamp2Test from './AESCTAM2Volume01.test';
import aesGChrTest from './AESGCHRVolume01.test';
import aesGenTest from './AESGENVolume01.test';
import aesGlen1Test from './AESGLEN1Volume01.test';
import aesGlen2Test from './AESGLEN2Volume01.test';
import aesGlen3Test from './AESGLEN3Volume01.test';
import aesGlen4Test from './AESGLEN4Volume01.test';
import aesGlen5Test from './AESGLEN5Volume01.test';
import aesJsonTest from './AESJSNVolume01.test';
import aesKeyChr1Test from './AESKCHR1Volume01.test';
import aesKeyChr2Test from './AESKCHR2Volume01.test';
import aesKeyLenTest from './AESKLENVolume01.test';
import aesTagTamp1Test from './AESTGTM1Volume01.test';
import aesTagTamp2Test from './AESTGTM2Volume01.test';
import rsaChainTest from './RSACHAINVolume01.test';
import rsaGenTest from './RSAGENVolume01.test';
import rsaKeyChrTest from './RSAKCHRVolume01.test';
import rsaKeyLenTest from './RSAKLENVolume01.test';
import rsaMsgTampTest from './RSAMSGTMVolume01.test';
import rsaSgChrTest from './RSASGCHRVolume01.test';
import rsaSgLen1Test from './RSASGLN1Volume01.test';
import rsaSgLen2Test from './RSASGLN2Volume01.test';
import rsaSgLen3Test from './RSASGLN3Volume01.test';
import rsaSgLen4Test from './RSASGLN4Volume01.test';
import rsaSgTampTest from './RSASGTAMVolume01.test';
import txtChrTest from './TXTCHRVolume01.test';
import txtLen1Test from './TXTLEN1Volume01.test';
import txtLen2Test from './TXTLEN2Volume01.test';
import aesKeyReal2Test from './AesKeyReal02.test';
import aesCipherReal2Test from './AesCipherReal02.test';
import aesGenReal1Test from './AesGenReal01.test';
import rsaKeyReal2Test from './RsaKeyReal02.test';
import rsaSignReal2Test from './RsaSignReal02.test';
import rsaGenReal1Test from './RsaGenReal01.test';
import textFileReal2Test from './TextFileReal02.test';
import cryptoUi from './CryptoUi.test';
import uiSeqTest from './UiSeqVolume01.test';

export default function testsuite() {
  aesKeyCore();
  aesCipherCore();
  rsaKeyCore();
  rsaSignVerifyCore();
  textFileCore();
  aesKeySeqTest();
  aesChrTest();
  aesSeqTest();
  aesSeq2Test();
  aesStateTest();
  rsaKeySeqTest();
  rsaSeqTest();
  rsaSeq2Test();
  rsaTampTest();
  rsaStateTest();
  aesChainTest();
  aesCtTamp1Test();
  aesCtTamp2Test();
  aesGChrTest();
  aesGenTest();
  aesGlen1Test();
  aesGlen2Test();
  aesGlen3Test();
  aesGlen4Test();
  aesGlen5Test();
  aesJsonTest();
  aesKeyChr1Test();
  aesKeyChr2Test();
  aesKeyLenTest();
  aesTagTamp1Test();
  aesTagTamp2Test();
  rsaChainTest();
  rsaGenTest();
  rsaKeyChrTest();
  rsaKeyLenTest();
  rsaMsgTampTest();
  rsaSgChrTest();
  rsaSgLen1Test();
  rsaSgLen2Test();
  rsaSgLen3Test();
  rsaSgLen4Test();
  rsaSgTampTest();
  txtChrTest();
  txtLen1Test();
  txtLen2Test();
  aesKeyReal2Test();
  aesCipherReal2Test();
  aesGenReal1Test();
  rsaKeyReal2Test();
  rsaSignReal2Test();
  rsaGenReal1Test();
  textFileReal2Test();
  cryptoUi();
  uiSeqTest();
}
