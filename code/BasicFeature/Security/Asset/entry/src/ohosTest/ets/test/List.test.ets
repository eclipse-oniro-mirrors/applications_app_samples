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

import keyAddVolume01 from './KeyAddVolume01.test';
import keyAddVolume02 from './KeyAddVolume02.test';
import keyAddVolume03 from './KeyAddVolume03.test';
import keyRmVolume01 from './KeyRmVolume01.test';
import keyRmVolume02 from './KeyRmVolume02.test';
import keyRmVolume03 from './KeyRmVolume03.test';
import keyQryVolume01 from './KeyQryVolume01.test';
import keyQryVolume02 from './KeyQryVolume02.test';
import keyQryVolume03 from './KeyQryVolume03.test';
import encodeVolume01 from './EncodeVolume01.test';
import encodeVolume02 from './EncodeVolume02.test';
import encodeVolume03 from './EncodeVolume03.test';
import convVolume01 from './ConvVolume01.test';
import convVolume02 from './ConvVolume02.test';
import convVolume03 from './ConvVolume03.test';
import parseDedupVolume01 from './ParseDedupVolume01.test';
import parseDedupVolume02 from './ParseDedupVolume02.test';
import parseDedupVolume03 from './ParseDedupVolume03.test';
import keyUpdVolume01 from './KeyUpdVolume01.test';
import keyUpdVolume02 from './KeyUpdVolume02.test';
import keyAuthVolume01 from './KeyAuthVolume01.test';
import keyAuthVolume02 from './KeyAuthVolume02.test';
import parseLabelVolume01 from './ParseLabelVolume01.test';
import parseLabelVolume02 from './ParseLabelVolume02.test';
import parseIntVolume01 from './ParseIntVolume01.test';
import parseIntVolume02 from './ParseIntVolume02.test';
import parseCmpVolume01 from './ParseCmpVolume01.test';
import parseCmpVolume02 from './ParseCmpVolume02.test';
import loggerVolume01 from './LoggerVolume01.test';
import loggerVolume02 from './LoggerVolume02.test';
import keyAddReal from './KeyAddReal.test';
import keyRmReal from './KeyRmReal.test';
import keyQryReal from './KeyQryReal.test';
import keyUpdReal from './KeyUpdReal.test';
import keyAuthReal from './KeyAuthReal.test';
import encodeReal from './EncodeReal.test';
import convReal from './ConvReal.test';
import parseDedupReal from './ParseDedupReal.test';
import parseLabelReal from './ParseLabelReal.test';
import parseIntReal from './ParseIntReal.test';
import parseCmpReal from './ParseCmpReal.test';
import loggerReal from './LoggerReal.test';
import saveUi from './SaveUi.test';
import deleteUi from './DeleteUi.test';
import queryUi from './QueryUi.test';
import updateUi from './UpdateUi.test';
import resultUi from './ResultUi.test';
import tabUi from './TabUi.test';

export default function testsuite() {
  keyAddVolume01();
  keyAddVolume02();
  keyAddVolume03();
  keyRmVolume01();
  keyRmVolume02();
  keyRmVolume03();
  keyQryVolume01();
  keyQryVolume02();
  keyQryVolume03();
  encodeVolume01();
  encodeVolume02();
  encodeVolume03();
  convVolume01();
  convVolume02();
  convVolume03();
  parseDedupVolume01();
  parseDedupVolume02();
  parseDedupVolume03();
  keyUpdVolume01();
  keyUpdVolume02();
  keyAuthVolume01();
  keyAuthVolume02();
  parseLabelVolume01();
  parseLabelVolume02();
  parseIntVolume01();
  parseIntVolume02();
  parseCmpVolume01();
  parseCmpVolume02();
  loggerVolume01();
  loggerVolume02();
  keyAddReal();
  keyRmReal();
  keyQryReal();
  keyUpdReal();
  keyAuthReal();
  encodeReal();
  convReal();
  parseDedupReal();
  parseLabelReal();
  parseIntReal();
  parseCmpReal();
  loggerReal();
  saveUi();
  deleteUi();
  queryUi();
  updateUi();
  resultUi();
  tabUi();
}
