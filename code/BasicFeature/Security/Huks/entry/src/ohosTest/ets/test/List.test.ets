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

import flagCore from './FlagCore.test';
import newKeyCore from './NewKeyCore.test';
import minAccessCore from './MinAccessCore.test';
import oldKeyCore from './OldKeyCore.test';
import aesSeqVolume01Test from './AesSeqVolume01.test';
import aesSeqVolume02Test from './AesSeqVolume02.test';
import aesSeqVolume03Test from './AesSeqVolume03.test';
import aesSeqVolume04Test from './AesSeqVolume04.test';
import aesSeqVolume05Test from './AesSeqVolume05.test';
import aesSeqVolume06Test from './AesSeqVolume06.test';
import aesSeqVolume07Test from './AesSeqVolume07.test';
import aesSeqVolume08Test from './AesSeqVolume08.test';
import aesSeqVolume09Test from './AesSeqVolume09.test';
import aesSeqReal01Test from './AesSeqReal01.test';
import aesSeqReal02Test from './AesSeqReal02.test';
import aesSeqReal03Test from './AesSeqReal03.test';
import oldKeySeqVolume01Test from './OldKeySeqVolume01.test';
import oldKeySeqVolume02Test from './OldKeySeqVolume02.test';
import oldKeySeqVolume03Test from './OldKeySeqVolume03.test';
import oldKeySeqVolume04Test from './OldKeySeqVolume04.test';
import oldKeySeqVolume05Test from './OldKeySeqVolume05.test';
import oldKeySeqVolume06Test from './OldKeySeqVolume06.test';
import oldKeySeqVolume07Test from './OldKeySeqVolume07.test';
import oldKeySeqVolume08Test from './OldKeySeqVolume08.test';
import oldKeySeqReal01Test from './OldKeySeqReal01.test';
import oldKeySeqReal02Test from './OldKeySeqReal02.test';
import oldKeySeqReal03Test from './OldKeySeqReal03.test';
import minAccessSeqVolume01Test from './MinAccessSeqVolume01.test';
import minAccessSeqVolume02Test from './MinAccessSeqVolume02.test';
import minAccessSeqVolume03Test from './MinAccessSeqVolume03.test';
import minAccessSeqVolume04Test from './MinAccessSeqVolume04.test';
import minAccessSeqVolume05Test from './MinAccessSeqVolume05.test';
import minAccessSeqVolume06Test from './MinAccessSeqVolume06.test';
import minAccessSeqVolume07Test from './MinAccessSeqVolume07.test';
import minAccessSeqReal01Test from './MinAccessSeqReal01.test';
import minAccessSeqReal02Test from './MinAccessSeqReal02.test';
import minAccessSeqReal03Test from './MinAccessSeqReal03.test';
import flagSeqVolume01Test from './FlagSeqVolume01.test';
import flagSeqVolume02Test from './FlagSeqVolume02.test';
import flagSeqVolume03Test from './FlagSeqVolume03.test';
import flagSeqVolume04Test from './FlagSeqVolume04.test';
import flagSeqVolume05Test from './FlagSeqVolume05.test';
import flagSeqVolume06Test from './FlagSeqVolume06.test';
import flagSeqReal01Test from './FlagSeqReal01.test';
import flagSeqReal02Test from './FlagSeqReal02.test';
import flagSeqReal03Test from './FlagSeqReal03.test';
import apiSmokeVolume01Test from './ApiSmokeVolume01.test';
import apiSmokeVolume02Test from './ApiSmokeVolume02.test';
import apiSmokeVolume03Test from './ApiSmokeVolume03.test';
import apiSmokeReal01Test from './ApiSmokeReal01.test';
import apiSmokeReal02Test from './ApiSmokeReal02.test';
import apiSmokeReal03Test from './ApiSmokeReal03.test';
import uiCore from './UiCore.test';
import uiSeqVolume01Test from './UiSeqVolume01.test';
import uiSeqVolume02Test from './UiSeqVolume02.test';
import uiSeqVolume03Test from './UiSeqVolume03.test';
import uiSeqVolume04Test from './UiSeqVolume04.test';
import uiSeqVolume05Test from './UiSeqVolume05.test';
import uiSeqVolume06Test from './UiSeqVolume06.test';
import uiSeqReal01Test from './UiSeqReal01.test';
import uiSeqReal02Test from './UiSeqReal02.test';
import uiSeqReal03Test from './UiSeqReal03.test';

export default function testsuite() {
  flagCore();
  newKeyCore();
  minAccessCore();
  oldKeyCore();
  aesSeqVolume01Test();
  aesSeqVolume02Test();
  aesSeqVolume03Test();
  aesSeqVolume04Test();
  aesSeqVolume05Test();
  aesSeqVolume06Test();
  aesSeqVolume07Test();
  aesSeqVolume08Test();
  aesSeqVolume09Test();
  aesSeqReal01Test();
  aesSeqReal02Test();
  aesSeqReal03Test();
  oldKeySeqVolume01Test();
  oldKeySeqVolume02Test();
  oldKeySeqVolume03Test();
  oldKeySeqVolume04Test();
  oldKeySeqVolume05Test();
  oldKeySeqVolume06Test();
  oldKeySeqVolume07Test();
  oldKeySeqVolume08Test();
  oldKeySeqReal01Test();
  oldKeySeqReal02Test();
  oldKeySeqReal03Test();
  minAccessSeqVolume01Test();
  minAccessSeqVolume02Test();
  minAccessSeqVolume03Test();
  minAccessSeqVolume04Test();
  minAccessSeqVolume05Test();
  minAccessSeqVolume06Test();
  minAccessSeqVolume07Test();
  minAccessSeqReal01Test();
  minAccessSeqReal02Test();
  minAccessSeqReal03Test();
  flagSeqVolume01Test();
  flagSeqVolume02Test();
  flagSeqVolume03Test();
  flagSeqVolume04Test();
  flagSeqVolume05Test();
  flagSeqVolume06Test();
  flagSeqReal01Test();
  flagSeqReal02Test();
  flagSeqReal03Test();
  apiSmokeVolume01Test();
  apiSmokeVolume02Test();
  apiSmokeVolume03Test();
  apiSmokeReal01Test();
  apiSmokeReal02Test();
  apiSmokeReal03Test();
  uiCore();
  uiSeqVolume01Test();
  uiSeqVolume02Test();
  uiSeqVolume03Test();
  uiSeqVolume04Test();
  uiSeqVolume05Test();
  uiSeqVolume06Test();
  uiSeqReal01Test();
  uiSeqReal02Test();
  uiSeqReal03Test();
}
